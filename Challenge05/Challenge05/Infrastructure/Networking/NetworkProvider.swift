//
//  NetworkProvider.swift
//  Challenge05
//
//  Created by Abdelahad on 22/01/2025.
//
import Foundation

public protocol NetworkProvider {
    func sendAndRetrieve<Response: Decodable>(method: HTTPMethod, destination: URL) async throws -> Response
}

final class BasicNetworkProvider: NetworkProvider {
    private let session: URLSession
    private let tokenProvider: TokenProvider
    private let decoderProvider: DecoderProvider
    
    init(session: URLSession = URLSession(configuration: .ephemeral), tokenProvider: TokenProvider = BearerTokenProvider(),
         decoderProvider: DecoderProvider = DefaultJsonDecoder()) {
        session.configuration.urlCache = nil
        session.configuration.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData

        self.session = session
        self.tokenProvider = tokenProvider
        self.decoderProvider = decoderProvider
    }
    
    func sendAndRetrieve<Response: Decodable>(method: HTTPMethod, destination: URL) async throws -> Response {
        var request = URLRequest(url: destination)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = [
            "Authorization": "Bearer \(tokenProvider.token())",
            "Content-Type": "application/json"
        ]
        do {

            let (data, response) = try await self.session.data(for: request)
            let result = try confirmResponse(
                data: data,
                response: response,
                type: Response.self,
                method: request.httpMethod,
                url: destination
            )
            return result
        } catch let error as NetworkError {
            throw error
        } catch {
            if (error as NSError).domain == NSURLErrorDomain  {
                if (error as NSError).code == NSURLErrorNotConnectedToInternet {
                    throw NetworkError.noInternetConnection
                } else if (error as NSError).code == NSURLErrorTimedOut {
                    throw NetworkError.requestTimeOut
                }
            }
            throw NetworkError.unexpected(message: "Failed to send", innerError: error)
        }
    }
    
    private func confirmResponse<Response: Decodable>(
        data: Data,
        response: URLResponse,
        type: Response.Type,
        method: String?,
        url: URL
    ) throws -> Response {
 
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.unexpected(message: "Returned a non-HTTPURLResponse (very strange!)")
        }
        let code = httpResponse.statusCode
        guard (200...299).contains(code) else {
            throw NetworkError.non200Code(errorCode: code)
        }
        do {
            return try decoderProvider.decode(type, from: data)
        } catch {
            throw error
        }
    }
}

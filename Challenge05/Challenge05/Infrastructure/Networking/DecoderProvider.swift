//
//  DecoderProvider.swift
//  Challenge05
//
//  Created by Abdelahad on 22/01/2025.
//

import Foundation

protocol DecoderProvider {
    func decode<T>(_ type: T.Type, from data: Data) throws -> T where T : Decodable
}

final class DefaultJsonDecoder: DecoderProvider {
    func decode<T>(_ type: T.Type, from data: Data) throws -> T where T : Decodable {
       let decoder =  JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(type, from: data)
    }
}

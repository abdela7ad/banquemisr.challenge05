//
//  NetworkError.swift
//  Challenge05
//
//  Created by Abdelahad on 22/01/2025.
//

public enum NetworkError: Error {
    
    /// An error happened that was unexpected.  An example could be JSON format
    /// failures of response objects
    case unexpected(message: String, innerError: Error? = nil)

    /// A non-200 series code was returned and extended info
    case non200Code(errorCode: Int)
    
    /// A response that was supposed to contain Data had none
    case noData
    
    /// No Internet Connection
    case noInternetConnection
    
    /// Request Time Out
    case requestTimeOut
    
    var readableMessage: String {
        switch self {
        case .unexpected, .non200Code, .noData:
            return "unexpected error. please contact the help center with code \(3000)"
        case .noInternetConnection:
            return "No Internet Connection, Connet And Pull To Refresh"
        case .requestTimeOut:
            return "Request Time out, Connet And Pull To Refresh"
        }
    }
}



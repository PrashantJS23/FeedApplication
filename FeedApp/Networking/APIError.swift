//
//  APIErrors.swift
//  FeedApp
//
//  Created by panther on 06/12/24.
//
import Foundation

enum APIError: Error {
    case requestFailed
    case jsonParsingFailure
    case jsonConversionFailure
    case invalidData
    case responseUnsuccessful
    case noConnection
    case other(Error)
    
    var localizationString: String {
        switch self {
        case .requestFailed: return "Request failed"
        case .jsonParsingFailure: return "JSON parsing failure"
        case .jsonConversionFailure: return "JSON conversion failure"
        case .invalidData: return "Invalid Data"
        case .responseUnsuccessful: return "Response unsuccessful"
        case .noConnection: return "No internet connection"
        case .other(let error): return error.localizedDescription
        }
    }
}

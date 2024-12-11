//
//  EndPoints.swift
//  FeedApp
//
//  Created by panther on 06/12/24.
//
import  Foundation

protocol EndPoint {
    var base: String { get }
    var path: String { get }
    var queryItems: [URLQueryItem]? { get }
}

extension EndPoint {
    var apiKey: String {
        return ""
    }
    
    var urlComponents: URLComponents{
        var components = URLComponents(string: base)!
        components.path = path
        if let queryItems {
            components.queryItems = queryItems
        }
//        components.query = apiKey
        return components
    }
    
    var request: URLRequest {
        let url = urlComponents.url!
        let request = URLRequest(url: url)
        return request
    }
}

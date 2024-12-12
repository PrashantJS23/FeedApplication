//
//  NetworkConfig.swift
//  FeedApp
//
//  Created by panther on 06/12/24.
//

import Foundation

enum NetworkConfig {
    case users
    case posts
    case comments(Int)
    case albums
    case photos
}

extension NetworkConfig: EndPoint {
    var base: String {
        return "https://jsonplaceholder.typicode.com"
    }
    
    var path: String {
        switch self {
        case .users: return "/users"
        case .posts: return "/posts"
        case .comments: return "/comments"
        case .albums: return "/albums"
        case .photos: return "/photos"
        }
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .comments(let id):
            return [URLQueryItem(name: "postId", value: "\(id)")]
        default:
            return nil
        }
    }
}

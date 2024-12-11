//
//  PostService.swift
//  FeedApp
//
//  Created by panther on 10/12/24.
//

import Foundation
import Combine

class PostService: NetworkClient {
    internal var session: URLSession
    
    init(configation: URLSessionConfiguration) {
        self.session = URLSession(configuration: configation)
    }
    
    convenience init() {
        self.init(configation: .default)
    }
    
    func getPostList(_ config: NetworkConfig) -> AnyPublisher<[Post], Error> {
        return execute(request: config.request, decodingType: [Post].self, retries: 2)
    }
}

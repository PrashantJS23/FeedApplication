//
//  CommentService.swift
//  FeedApp
//
//  Created by panther on 10/12/24.
//

import Foundation
import Combine

class CommentService: NetworkClient {
    var session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    func getComments(_ config: NetworkConfig) -> AnyPublisher<[Comment], Error> {
        execute(request: config.request, decodingType: [Comment].self, retries: 2)
    }
}

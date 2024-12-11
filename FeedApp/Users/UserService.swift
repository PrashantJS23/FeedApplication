//
//  UserService.swift
//  FeedApp
//
//  Created by panther on 06/12/24.
//

import Foundation
import Combine

class UserService: NetworkClient {
    var session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    func getUserList(_ config: NetworkConfig) -> AnyPublisher<[User], Error> {
        return execute(request: config.request, decodingType: [User].self, retries: 2)
    }
}

//
//  TodoService.swift
//  FeedApp
//
//  Created by panther on 12/12/24.
//

import SwiftUI
import Combine

class TodoService: NetworkClient, TodoServiceInterface {
    var session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    func getTodos(_ config: NetworkConfig) -> AnyPublisher<[Todo], any Error> {
        execute(request: config.request, decodingType: [Todo].self, retries: 2)
    }
}

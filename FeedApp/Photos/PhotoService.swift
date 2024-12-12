//
//  PhotoService.swift
//  FeedApp
//
//  Created by panther on 11/12/24.
//

import Foundation
import Combine

class PhotoService: NetworkClient, PhotoServiceInterface{
    var session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    func getPhotos(_ config: NetworkConfig) -> AnyPublisher<[Photo], any Error> {
        execute(request: config.request, decodingType: [Photo].self, retries: 2)
    }
}

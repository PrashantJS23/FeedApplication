//
//  AlbumService.swift
//  FeedApp
//
//  Created by panther on 11/12/24.
//

import Foundation
import Combine

class AlbumService: NetworkClient, AlbumServiceInterface {
    
    var session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }

    func getAlbums(_ config: NetworkConfig) -> AnyPublisher<[Album], any Error> {
        execute(request: config.request, decodingType: [Album].self, retries: 2)
    }
}

//
//  PhotoInterface.swift
//  FeedApp
//
//  Created by panther on 11/12/24.
//

import Foundation
import Combine

protocol PhotoServiceInterface {
    func getPhotos(_ config: NetworkConfig) -> AnyPublisher<[Photo], Error>
}

protocol PhotoViewModelInterface {
    func getPhotos(albumId: Int)
}

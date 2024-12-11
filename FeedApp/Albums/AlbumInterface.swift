//
//  AlbumInterface.swift
//  FeedApp
//
//  Created by panther on 11/12/24.
//
import Combine

protocol AlbumViewModelInterface {
    func getAlbums()
}

protocol AlbumServiceInterface {
    func getAlbums(_ config: NetworkConfig) -> AnyPublisher<[Album], Error>
}

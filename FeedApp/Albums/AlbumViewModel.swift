//
//  AlbumViewModel.swift
//  FeedApp
//
//  Created by panther on 11/12/24.
//

import Foundation
import Combine

class AlbumViewModel: ObservableObject, AlbumViewModelInterface {
    @Published var albums: [Album]?
    @Published var isRefresh: Bool = true
    private var service: AlbumService
    private var cancellable = Set<AnyCancellable>()
    
    init(service: AlbumService){
        self.service = service
    }
    
    func getAlbums() {
        isRefresh = true
        service.getAlbums(.posts)
            .sink { [weak self] value in
                switch value {
                case .failure(let error):
                    Console.log(message: "Error while fetching albums \(error)")
                    self?.albums = nil
                    self?.isRefresh = false
                case .finished:
                    break
                }
            } receiveValue: { [weak self] albums in
                self?.albums = albums
                self?.isRefresh = false
            }
            .store(in: &cancellable)
    }
}

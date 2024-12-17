//
//  PhotoViewModel.swift
//  FeedApp
//
//  Created by panther on 11/12/24.
//

import Foundation
import Combine

class PhotoViewModel: ObservableObject, PhotoViewModelInterface {
    @Published var photos:[Photo]?
    @Published var isRefresh: Bool = false
    private var service: PhotoService
    private var cancallable = Set<AnyCancellable>()
    
    init(service: PhotoService) {
        self.service = service
    }
    
    func getPhotos(albumId: Int) {
        service.getPhotos(.photos)
            .sink { [weak self] value in
                switch value {
                case .failure(let error):
                    Console.log(message: "Error while fetching photos \(error)")
                    self?.photos = nil
                    self?.isRefresh = false
                case .finished:
                    break
                }
            } receiveValue: { [weak self] photos in
                self?.photos = photos.filter{ $0.albumId == albumId }
                self?.isRefresh = false
            }
            .store(in: &cancallable)
    }
}

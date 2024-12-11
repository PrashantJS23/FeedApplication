//
//  PostViewModel.swift
//  FeedApp
//
//  Created by panther on 10/12/24.
//

import Foundation
import Combine

class PostViewModel: ObservableObject {
    private let service: PostService
    @Published var posts: [Post]?
    @Published var isRefresh: Bool = true
    private var cancellable = Set<AnyCancellable>()
    init(service: PostService) {
        self.service = service
    }
    
    func getPostList(userId: Int) {
        isRefresh = true
        service.getPostList(.posts).sink {[weak self] value in
            switch value {
            case .failure(let error):
                Console.log(message: "ERROR while fetching Posts \(error)")
                self?.posts = nil
                self?.isRefresh = false
            case .finished:
                break
            }
        } receiveValue: {[weak self] posts in
            self?.posts = posts.filter{$0.userId == userId }
            self?.isRefresh = false
        }
        .store(in: &cancellable)
    }
}

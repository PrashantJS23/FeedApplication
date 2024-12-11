//
//  CommentViewModel.swift
//  FeedApp
//
//  Created by panther on 10/12/24.
//

import Foundation
import Combine

class CommentViewModel: ObservableObject {
    @Published var comments: [Comment]?
    @Published var isRefresh: Bool = true
    private let service: CommentService
    private var cancellable = Set<AnyCancellable>()
    
    init(service: CommentService) {
        self.service = service
    }
    
    func getComments(postId: Int) {
        isRefresh = true
        service.getComments(.comments(postId))
            .sink { [weak self] value in
                switch value {
                case .failure(let error):
                    Console.log(message: "ERROR while fetching Comments \(error)")
                    self?.comments = nil
                    self?.isRefresh = false
                case .finished:
                    break
                }
            } receiveValue: {[weak self] comments in
                self?.comments = comments
                self?.isRefresh = false
            }
            .store(in: &cancellable)

    }
}

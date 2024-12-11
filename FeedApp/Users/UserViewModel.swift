//
//  UserViewModel.swift
//  FeedApp
//
//  Created by panther on 06/12/24.
//

import Foundation
import Combine

class UserViewModel: ObservableObject {
    @Published var users: [User]?
    @Published var isRefresh: Bool = true
    private let service: UserService
    private var cancellables = Set<AnyCancellable>()
    init(service: UserService) {
        self.service = service
    }
    
    func getUsers() {
        isRefresh = true
        service.getUserList(.users)
            .sink { [weak self] value in
                switch value {
                case .failure(let error):
                    Console.log(message: "ERROR while fetching Users \(error)")
                    self?.users = nil
                    self?.isRefresh = false
                case .finished:
                    break
                }
            } receiveValue: {[weak self] users in
                self?.users = users
                self?.isRefresh = false
            }
            .store(in: &cancellables)
    }
}

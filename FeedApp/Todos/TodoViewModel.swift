//
//  TodoViewModel.swift
//  FeedApp
//
//  Created by panther on 12/12/24.
//

import SwiftUI
import Combine

class TodoViewModel: ObservableObject, TodoViewModelInterface {
    @Published var todos: [Todo]?
    @Published var isRefresh: Bool = true
    private var service: TodoService
    private var cancellable = Set<AnyCancellable>()
    
    init(service: TodoService) {
        self.service = service
    }
    
    func getTodos() {
        isRefresh = true
        service.getTodos(.todos)
            .sink {[weak self] value in
                switch value {
                case .failure(let error):
                    Console.log(message: "ERRRO while fetching todos list \(error)")
                    self?.todos = nil
                    self?.isRefresh = false
                case .finished:
                    break
                }
            } receiveValue: {[weak self] todos in
                self?.todos = todos
                self?.isRefresh = false
            }
            .store(in: &cancellable)
    }
    
    func getTodoImage(todo: Todo) -> Image {
        todo.completed ? Image(systemName: Config.resource.checkmarkCircleFill) : Image(systemName: Config.resource.checkmarkCircle)
    }
}

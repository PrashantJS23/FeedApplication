//
//  TodoInterface.swift
//  FeedApp
//
//  Created by panther on 12/12/24.
//
import Combine
import SwiftUI

protocol TodoViewModelInterface {
    func getTodos() 
}

protocol TodoServiceInterface {
    func getTodos(_ config: NetworkConfig) -> AnyPublisher<[Todo], Error>
}

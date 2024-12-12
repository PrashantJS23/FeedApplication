//
//  Todo.swift
//  FeedApp
//
//  Created by panther on 12/12/24.
//

import Foundation

struct Todo: Decodable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}

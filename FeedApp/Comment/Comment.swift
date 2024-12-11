//
//  Comment.swift
//  FeedApp
//
//  Created by panther on 10/12/24.
//

import Foundation

struct Comment: Decodable {
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String
}

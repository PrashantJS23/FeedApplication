//
//  Photo.swift
//  FeedApp
//
//  Created by panther on 11/12/24.
//

import Foundation

struct Photo: Decodable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}

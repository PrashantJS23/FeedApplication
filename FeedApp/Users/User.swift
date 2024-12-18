//
//  User.swift
//  FeedApp
//
//  Created by panther on 06/12/24.
//

import Foundation

struct User: Decodable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let phone: String
    let website: String
    let address: Address
    let company: Company
}

struct Address: Decodable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: Geo
}

struct Geo: Decodable {
    let lat: String
    let long: String
    
    enum CodingKeys: String, CodingKey {
        case lat
        case long = "lng"
    }
}

struct Company: Decodable {
    let name: String
    let catchPhrase: String
    let bs: String
}

let dummyUser = User(
    id: 1,
    name: "Leanne Graham",
    username: "Bret",
    email:  "Sincere@april.biz",
    phone: "1-770-736-8031 x56442",
    website: "hildegard.org",
    address: Address(
        street: "Kulas Light",
        suite: "Apt. 556",
        city: "Gwenborough",
        zipcode: "92998-3874",
        geo: Geo(
            lat: "-37.3159",
            long: "81.1496"
        )
    ), company: Company(
        name: "Romaguera-Crona",
        catchPhrase: "Multi-layered client-server neural-net",
        bs: "harness real-time e-markets"
    )
)

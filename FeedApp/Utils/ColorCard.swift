//
//  ColorCard.swift
//  FeedApp
//
//  Created by panther on 12/12/24.
//

import Foundation

struct ColorCard: Identifiable {
    let id = UUID()
    var theme: Theme
}

extension ColorCard {
    static let sampleData: [ColorCard] = [
        ColorCard(
            theme: Theme.allCases[0]
        ),
        ColorCard(
            theme: Theme.allCases[1]
        ),
        ColorCard(
            theme: Theme.allCases[2]
        ),
    ]
}

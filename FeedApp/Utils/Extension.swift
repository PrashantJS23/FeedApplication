//
//  Extension.swift
//  FeedApp
//
//  Created by panther on 06/12/24.
//
import Foundation
import SwiftUI

extension Color {

    static func random(randomOpacity: Bool = false) -> Color {
        Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            opacity: randomOpacity ? .random(in: 0...1) : 1
        )
    }
}

extension View {
    func cardBackground(color: Color? = nil) -> some View {
        modifier(CardBackground(color: color))
    }
}

struct Console {
    static func log(message: String) {
        debugPrint(message)
    }
}

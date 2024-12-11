//
//  Modifier.swift
//  FeedApp
//
//  Created by panther on 06/12/24.
//

import SwiftUI

struct CardBackground: ViewModifier {
    var color: Color?
    func body(content: Content) -> some View {
        content
            .background(color ?? Color.random())
            .cornerRadius(16)
            .shadow(color: Color.black.opacity(0.2), radius: 4)
    }
}


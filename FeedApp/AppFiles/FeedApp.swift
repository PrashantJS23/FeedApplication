//
//  FeedAppApp.swift
//  FeedApp
//
//  Created by panther on 05/12/24.
//

import SwiftUI
import SwiftData

@main
struct FeedApp: App {
//    var sharedModelContainer: ModelContainer = {
//        let schema = Schema([
//            Item.self,
//        ])
//        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
//
//        do {
//            return try ModelContainer(for: schema, configurations: [modelConfiguration])
//        } catch {
//            fatalError("Could not create ModelContainer: \(error)")
//        }
//    }()

    var body: some Scene {
        WindowGroup {
            UserView(viewModel: UserViewModel(service: UserService()))
        }
//        .modelContainer(sharedModelContainer)
    }
}

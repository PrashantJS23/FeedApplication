//
//  UserMenu.swift
//  FeedApp
//
//  Created by panther on 06/12/24.
//

import SwiftUI

struct UserMenu: View {
    let user: User
    let columns = Array(repeating: GridItem(.flexible(), spacing: 16), count: 2)
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: columns, spacing: 16, content: {
                ForEach(Config.array.userMenu, id: \.self) { item in
                    NavigationLink {
                        switch item {
                        case Config.string.posts:
                            PostView(viewModel: PostViewModel(service: PostService()), user: user)
                        case Config.string.albums:
                            AlbumView(viewModel: AlbumViewModel(service: AlbumService()))
                        default:
                            EmptyView()
                        }
                    } label: {
                        HStack(spacing: 16) {
                            Image(systemName: Config.resource.menucardFill)
                                .resizable()
                                .frame(width: 40, height: 50, alignment: .leading)
                                .aspectRatio(contentMode: .fit)
                                .foregroundStyle(.white)
                            Text(item)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
                        .cardBackground()
                    }
                }
            })
            .padding()
            .navigationTitle(Config.navTitle.menu)
            .navigationBarTitleDisplayMode(.inline)
        }
        .background(.background)
    }
}

#Preview {
    UserMenu(user: dummyUser)
}

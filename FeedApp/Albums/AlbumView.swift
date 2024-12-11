//
//  Album.swift
//  FeedApp
//
//  Created by panther on 11/12/24.
//

import SwiftUI

struct AlbumView: View {
    @ObservedObject var viewModel: AlbumViewModel
    let columns = Array(repeating: GridItem(.flexible(), spacing: 16), count: 3)
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(viewModel.albums ?? [], id: \.id) { album in
                    NavigationLink {
                        EmptyView()
                    } label: {
                        VStack(alignment: .center) {
                            Image(systemName: Config.resource.menucard)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .foregroundStyle(.white)
                            Text(album.title)
                                .lineLimit(2)
                                .font(.subheadline)
                                .foregroundStyle(.white)
                        }
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
                        .cardBackground()
                    }
                }
            }
        }
        .padding()
        .onAppear{
            viewModel.getAlbums()
        }
        .navigationTitle(Config.navTitle.albums)
        .background(.background)
    }
}

#Preview {
    AlbumView(viewModel: AlbumViewModel(service: AlbumService()))
}

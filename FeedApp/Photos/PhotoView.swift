//
//  PhotoView.swift
//  FeedApp
//
//  Created by panther on 11/12/24.
//

import SwiftUI

struct PhotoView: View {
    @ObservedObject var viewModel: PhotoViewModel
    let albumId: Int
    let columns = Array(repeating: GridItem(.flexible(), spacing: 16), count: 3)
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(viewModel.photos ?? [], id: \.id) { photo in
                    AsyncImage(url: URL(string: photo.url)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(8.0)
                }
            }
            .padding()
        }
        .onAppear {
            viewModel.getPhotos(albumId: albumId)
        }
        .navigationTitle(Config.navTitle.photos)
    }
}

#Preview {
    PhotoView(viewModel: PhotoViewModel(service: PhotoService()), albumId: 1)
}

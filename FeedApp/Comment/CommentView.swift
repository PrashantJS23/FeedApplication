//
//  Comment.swift
//  FeedApp
//
//  Created by panther on 10/12/24.
//

import SwiftUI

struct CommentView: View {
    @ObservedObject var viewModel: CommentViewModel
    let post: Post
    var body: some View {
        ScrollView(.vertical) {
            ForEach(viewModel.comments ?? [], id: \.id) { comment in
                VStack(alignment: .leading, spacing: 16) {
                    HStack(spacing: 16) {
                        Image(systemName: Config.resource.personCircleFill)
                            .resizable()
                            .foregroundStyle(Color.random())
                            .frame(width: 40, height: 40)
                        VStack(alignment: .leading) {
                            Text(comment.name)
                                .font(.headline)
                                .foregroundStyle(.primary)
                        }
                    }
                    Divider()
                    Text(post.body)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                .padding()
                .cardBackground(color: .white)
                .padding([.bottom], 8)
            }
            .padding()
            .onAppear {
                viewModel.getComments(postId: post.id)
            }
            .navigationTitle(Config.navTitle.comment)
            .background(.background)
        }
    }
}

#Preview {
    CommentView(
        viewModel: CommentViewModel(service: CommentService()),
        post: dummyPost
    )
}

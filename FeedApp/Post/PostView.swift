//
//  PostVIew.swift
//  FeedApp
//
//  Created by panther on 10/12/24.
//

import SwiftUI

struct PostView: View {
    @ObservedObject var viewModel: PostViewModel
    let user: User
    var body: some View {
        ScrollView(.vertical) {
            ForEach(viewModel.posts ?? [], id: \.id) { post in
                VStack(alignment: .leading, spacing: 16) {
                    HStack(spacing: 16) {
                        Image(systemName: Config.resource.personCircleFill)
                            .resizable()
                            .foregroundStyle(Color.random())
                            .frame(width: 40, height: 40)
                        VStack(alignment: .leading) {
                            Text(user.name)
                                .font(.headline)
                                .foregroundStyle(.primary)
                            Text(user.email)
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                    }
                    Divider()
                    Text(post.title)
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text(post.body)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    Divider()
                    HStack(alignment: .center) {
                        ActionView(
                            action: Config.string.like,
                            icon: Config.resource.handThumbsup,
                            destinationView: CommentView(
                                viewModel: CommentViewModel(service: CommentService()),
                                post: post)
                        ).allowsHitTesting(false)
                        Divider()
                        ActionView(
                            action: Config.string.comment,
                            icon: Config.resource.message,
                            destinationView: CommentView(
                                viewModel: CommentViewModel(service: CommentService()),
                                post: post)
                        )
                    }
                }
                .padding()
                .cardBackground(color: .white)
                .padding([.bottom], 8)
            }
            .padding()
            .onAppear {
                viewModel.getPostList(userId: user.id)
            }
        }
        .background(.background)
        .navigationTitle(Config.navTitle.post)
    }
}

struct ActionView<Content: View>: View {
    let action: String
    let icon: String
    private var destinationView: Content
    init(action: String, icon: String, destinationView: Content) {
        self.destinationView = destinationView
        self.action = action
        self.icon = icon
    }
    var body: some View {
        NavigationLink {
            destinationView
        } label: {
            HStack(spacing: 4){
                Image(systemName: icon)
                Text(action)
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity)
        }
        .foregroundStyle(.secondary)
    }
}

#Preview {
    PostView(viewModel: PostViewModel(service: PostService()), user: dummyUser)
}

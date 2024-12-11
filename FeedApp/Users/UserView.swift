//
//  Users.swift
//  FeedApp
//
//  Created by panther on 05/12/24.
//

import SwiftUI

struct UserView: View {
    @ObservedObject var viewModel: UserViewModel
    var body: some View {
        NavigationStack {
            List(viewModel.users ?? [], id: \.id) { user in
                NavigationLink {
                    UserMenu(user: user)
                } label: {
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
                }
            }
            .navigationTitle(Config.navTitle.users)
            .onAppear {
                viewModel.getUsers()
            }
        }
    }
}

#Preview {
    UserView(viewModel: UserViewModel(service: UserService()))
}

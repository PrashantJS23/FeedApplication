//
//  TodoView.swift
//  FeedApp
//
//  Created by panther on 12/12/24.
//

import SwiftUI

struct TodoView: View {
    @ObservedObject var viewModel: TodoViewModel
    var body: some View {
//        List {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(viewModel.todos ?? [], id: \.id) { todo in
                HStack(spacing: 16) {
                    viewModel.getTodoImage(todo: todo)
                        .resizable()
                        .foregroundStyle(todo.completed ? Color.white : .white.opacity(0.2))
                        .frame(width: 30, height: 30)
                    Text(todo.title)
                        .font(.body)
                        .foregroundStyle(.white)
                    Spacer()
                }
                .padding()
                .cardBackground()
                .padding(
                    EdgeInsets(
                        top: 4,
                        leading: 8,
                        bottom: 4,
                        trailing: 8
                    )
                )
            }
            //            .listRowSeparator(.hidden)
            //            .listRowBackground(
            //                RoundedRectangle(cornerRadius: 16)
            //                    .background(.clear)
            //                    .foregroundColor(colorCard.theme.accentColor.opacity(0.2))
            //                    .padding(
            //                        EdgeInsets(
            //                            top: 8,
            //                            leading: 16,
            //                            bottom: 8,
            //                            trailing: 16
            //                        )
            //                    )
            //            )
            //        }
            //        .listStyle(.plain)
            .onAppear {
                viewModel.getTodos()
            }
            .navigationTitle(Config.navTitle.todos)
        }
    }
}

#Preview {
    TodoView(
        viewModel: TodoViewModel(
        service: TodoService()))
}

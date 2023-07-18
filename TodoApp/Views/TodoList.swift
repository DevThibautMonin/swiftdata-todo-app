//
//  TodoList.swift
//  TodoApp
//
//  Created by Thibaut Monin on 16/07/2023.
//

import SwiftUI
import SwiftData

struct TodoList: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query(
        sort: \.creationDate,
        order: .forward
    ) private var todos: [Todo]
    @State private var showAddPopup = false
    @State private var todoEdit: Todo?
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(todos) { todo in
                    VStack {
                        HStack {
                            Text(todo.title)
                            
                            Spacer()
                            
                            Button {
                                todo.isCompleted.toggle()
                            } label: {
                                Image(systemName: "checkmark")
                                    .symbolVariant(.circle.fill)
                                    .foregroundColor(todo.isCompleted ? .green : .gray)
                                    .font(.largeTitle)
                            }
                        }
                        .swipeActions {
                            Button {
                                todoEdit = todo
                            } label: {
                                Label("Edit", systemImage: "pencil")
                                    .symbolVariant(.fill)
                            }.tint(.orange)
                        }
                        .swipeActions(edge: .leading) {
                            Button(role: .destructive) {
                                withAnimation(.bouncy) {
                                    modelContext.delete(object: todo)
                                }
                            } label: {
                                Label("Delete", systemImage: "trash")
                                    .symbolVariant(.fill)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Todo")
            .toolbar() {
                ToolbarItem {
                    Button {
                        showAddPopup.toggle()
                    } label: {
                        Label("Add todo", systemImage: "plus")
                    }
                }
            }.sheet(isPresented: $showAddPopup, content: {
                NavigationStack {
                    TodoAdd().presentationDetents([.medium])
                }
            })
            .sheet(item: $todoEdit) {
                todoEdit = nil
            } content: { todo in
                TodoEdit(todo: todo)
            }
            
        }
    }
    
}

//
//  TodoEdit.swift
//  TodoApp
//
//  Created by Thibaut Monin on 17/07/2023.
//

import SwiftUI
import SwiftData

struct TodoAdd: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    @State private var todo = Todo()
    
    var body: some View {
        List {
            TextField("Title", text: $todo.title)
            Button {
                context.insert(todo)
                dismiss()
            } label: {
                Label("Create", systemImage: "plus")
                    .symbolVariant(.fill)
            }
        }.navigationTitle("Create a todo")
    }
}

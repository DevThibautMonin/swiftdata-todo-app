//
//  TodoEdit.swift
//  TodoApp
//
//  Created by Thibaut Monin on 17/07/2023.
//

import SwiftUI
import SwiftData

struct TodoEdit: View {
    
    @Environment(\.dismiss) var dismiss
    @Bindable var todo: Todo
    
    var body: some View {
        List {
            TextField("Title", text: $todo.title)
            Button {
                dismiss()
            } label: {
                Label("Edit", systemImage: "pencil")
                    .symbolVariant(.fill)
            }
        }.navigationTitle("Edit a todo")
    }
}

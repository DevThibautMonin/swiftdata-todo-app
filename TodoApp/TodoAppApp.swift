//
//  TodoAppApp.swift
//  TodoApp
//
//  Created by Thibaut Monin on 16/07/2023.
//

import SwiftUI
import SwiftData

@main
struct TodoAppApp: App {

    var body: some Scene {
        WindowGroup {
            TodoList().modelContainer(for: Todo.self)
        }
    }
}

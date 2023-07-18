//
//  TodoItem.swift
//  TodoApp
//
//  Created by Thibaut Monin on 16/07/2023.
//

import Foundation
import SwiftData

@Model
final class Todo {
    var title: String
    var creationDate: Date
    var isCompleted: Bool
    
    init(title: String = "", creationDate: Date = .now, isCompleted: Bool = false) {
        self.title = title
        self.creationDate = creationDate
        self.isCompleted = isCompleted
    }
}

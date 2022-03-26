//
//  TodoObject.swift
//  todo-app
//
//  Created by Ergün Yunus Cengiz on 26.03.2022.
//

import Foundation

enum StateOfTask {
    case inProgress
    case done
    case late
}

struct TodoObj : Codable {
    var id: String
    var header: String
    var description: String
    var state: String
    var date: Date
}

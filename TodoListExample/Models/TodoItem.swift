//
//  TodoItem.swift
//  TodoListExample
//
//  Created by Jesus Jaime Cano Terrazas on 31/07/21.
//

import Foundation
import UIKit

class TodoItem {
    
    var title = ""
    var notes = ""
    var done = false
    var color = UIColor.lightGray
    
    init(title: String, notes: String, done: Bool, color: UIColor) {
        self.title = title
        self.notes = notes
        self.done = done
        self.color = color
    }
}

//
//  TodoItemTableViewCell.swift
//  TodoListExample
//
//  Created by Jesus Jaime Cano Terrazas on 31/07/21.
//

import UIKit

class TodoItemTableViewCell: UITableViewCell {
    
    var todoItem: TodoItem! {
        didSet {
            self.configureCell()
        }
    }

    @IBOutlet weak var todoTitleLabel: UILabel!
    @IBOutlet weak var colorIndicatorView: UIView!
    
    // MARK: Private Methods
    
    private func configureCell() {
        if todoItem.done {
            self.colorIndicatorView.backgroundColor = .green
            let attributesDict: [NSAttributedString.Key: Any] = [
                NSAttributedString.Key.strikethroughStyle: 1,
                NSAttributedString.Key.underlineColor: 1
            ]
            
            let attributesString = NSAttributedString(string: todoItem.title, attributes: attributesDict)
            
            self.todoTitleLabel.attributedText = attributesString
        } else {
            self.colorIndicatorView.backgroundColor = todoItem.color
            self.todoTitleLabel.text = todoItem.title
        }
        
    }
    

}

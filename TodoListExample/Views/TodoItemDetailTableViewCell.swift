//
//  TodoItemDetailTableViewCell.swift
//  TodoListExample
//
//  Created by Jesus Jaime Cano Terrazas on 31/07/21.
//

import UIKit

class TodoItemDetailTableViewCell: UITableViewCell {
    
    var todoItem: TodoItem! {
        didSet {
            configureView()
        }
    }
    
    @IBOutlet weak var titleTodoLabel: UILabel!
    @IBOutlet weak var detailTodoLabel: UILabel!
    @IBOutlet weak var colorIndicatorView: UIView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: Private Methods
    
    private func configureView() { 
        if todoItem.done {
            self.colorIndicatorView.backgroundColor = .green
            
            let attributesDict: [NSAttributedString.Key: Any] = [
                NSAttributedString.Key.strikethroughStyle: 1,
                NSAttributedString.Key.underlineColor: 1
            ]
            
            let attributesStringTitle = NSAttributedString(string: todoItem.title, attributes: attributesDict)
            let attributesStringNotes = NSAttributedString(string: todoItem.notes, attributes: attributesDict)
            
            self.titleTodoLabel.attributedText = attributesStringTitle
            self.detailTodoLabel.attributedText = attributesStringNotes
            
        } else {
            self.colorIndicatorView.backgroundColor = todoItem.color
            self.titleTodoLabel.text = todoItem.title
            self.detailTodoLabel.text = todoItem.notes
        }
    }

}

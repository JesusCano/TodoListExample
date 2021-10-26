//
//  SelectColorViewController.swift
//  TodoListExample
//
//  Created by Jesus Jaime Cano Terrazas on 07/08/21.
//

import UIKit

protocol SelectColorDelegate: AnyObject {
    func colorSelected(color: UIColor)
}

class SelectColorViewController: UIViewController {
    
    weak var delegate: SelectColorDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - User interaction

    @IBAction func colorSelectedButton(_ sender: UIButton) {
        guard let color = sender.backgroundColor else { return }
        
        // 5
        delegate?.colorSelected(color: color)
    }
}

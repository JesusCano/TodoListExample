//
//  CreateToDoViewController.swift
//  TodoListExample
//
//  Created by Jesus Jaime Cano Terrazas on 31/07/21.
//

import UIKit

/*
 1) Declaramos nuestro protocolo
 2) Declaramos una variable llamada 'delegate' del tipo del protocolo en la clase desde donde vamos a enviar los datos
 3) Implementamos el protocolo en la clase en la que vamos a recibir los datos
 4) Asignamos la variable 'delegate' en el prepareForSegue de la clase que va a recibir los datos
 5) Mandamos los datos a través de la variable 'delegate' desde la clase que los contiene
 */


// 1
protocol CreateTodoDelegate: AnyObject {
    func createTodoDidCreate(todoItem: TodoItem)
}

class CreateToDoViewController: BaseViewController {
    
    // 2
    weak var delegate: CreateTodoDelegate?
    
    @IBOutlet weak var newTaskBottonConstraint: NSLayoutConstraint!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var notesTextField: UITextField!
    @IBOutlet weak var colorButton: UIButton!
    
    private var selectedColor = UIColor.lightGray
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // With thhis thing, we know that this class will subscribe to the keyboard notifications
        manageKeyboard = true
    }
    
    
     // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SelectColorViewController" {
            let selectColorViewController = segue.destination as! SelectColorViewController
            
            // 4
            selectColorViewController.delegate = self
        }
    }
    
    
    // MARK: - Keyboard
    
    override func keyboardWillShow(notification: Notification) {
        print("Se presenta el teclado")
        if let userInfo = notification.userInfo {
            let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue
            let keyboardFrame = keyboardSize.cgRectValue
            
            self.newTaskBottonConstraint.constant = keyboardFrame.height - view.safeAreaInsets.bottom
            
            let animationTime = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
            UIView.animate(withDuration: animationTime) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
    override func keyboardWillHide(notification: Notification) {
        print("Se oculta el teclado")
        
        if let userInfo = notification.userInfo {
            self.newTaskBottonConstraint.constant = 0
            
            let animationTime = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
            
            UIView.animate(withDuration: animationTime) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
    // MARK: - User interaction
    
    @IBAction func createButtonPressed(_ sender: UIButton) {
        guard let title = titleTextField.text else { return }
        guard let notes = notesTextField.text else { return }
        
        let todoItem = TodoItem(title: title, notes: notes, done: false, color: selectedColor)
        
        // 5
        
        delegate?.createTodoDidCreate(todoItem: todoItem)
    }
    
}

// MARK: - SelectColorDelegate

extension CreateToDoViewController: SelectColorDelegate {
    func colorSelected(color: UIColor) {
        print("Colo: \(color)")
        self.selectedColor = color
        colorButton.backgroundColor = color
        navigationController?.popViewController(animated: true)
    }
    
}

//
//  ConfigurationViewController.swift
//  TodoListExample
//
//  Created by Jesus Jaime Cano Terrazas on 31/07/21.
//

import UIKit

class ConfigurationViewController: UIViewController {
    
    @IBOutlet weak var detailSwitch: UISwitch!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let isDetailActive = UserDefaults.standard.bool(forKey: "DETAIL_ACTIVE")

        self.detailSwitch.setOn(isDetailActive, animated: false)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: User Interaction
    
    
    @IBAction func detailSwitchChange(_ sender: UISwitch) {
        
        print("Changed...")
        UserDefaults.standard.set(sender.isOn, forKey: "DETAIL_ACTIVE")
        
        // It wili be deprecated in the future
        UserDefaults.standard.synchronize()
    }
    
}

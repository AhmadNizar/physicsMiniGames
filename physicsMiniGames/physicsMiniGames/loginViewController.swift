//
//  LoginViewController.swift
//  physicsMiniGames
//
//  Created by Christian Widjaja on 25/04/19.
//  Copyright © 2019 Ahmad Nizar. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var nameField: UITextField!
    var playerName: String = ""
    
    @IBAction func askName(_ sender: Any) {
//        playerName = nameField.text
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

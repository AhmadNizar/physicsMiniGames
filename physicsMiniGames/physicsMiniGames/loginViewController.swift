//
//  LoginViewController.swift
//  physicsMiniGames
//
//  Created by Christian Widjaja on 25/04/19.
//  Copyright © 2019 Ahmad Nizar. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

@IBDesignable
class LoginViewController: UIViewController {

    @IBOutlet weak var submitButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    
    backgroundGradientColor()
        
     submitButton.layer.cornerRadius = 5
       submitButton.layer.borderWidth = 1
        nameField.layer.borderWidth = 1
        nameField.layer.cornerRadius = 5
        


    }

    @IBOutlet weak var nameField: UITextField!
    
    var playerName: String = ""
    
    @IBAction func askName(_ sender: Any) {
        
        
        var params: Parameters = [:]
        
        if let username = nameField.text {
            params["username"] = username
        }

        Alamofire.request(
            "http://10.60.48.159:3000/users/",
            method: .post,
            parameters: params
        ).responseData { responseData in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                print(swiftyJsonVar)
            }
        }
    
    }
    
    func backgroundGradientColor(){
        let newlayer = CAGradientLayer()
        newlayer.frame = view.bounds
        newlayer.colors = [UIColor(red: 0.58, green: 0.90, blue: 0.99, alpha: 1.0).cgColor, UIColor(red: 0.41, green: 0.74, blue: 1.0, alpha: 1.0).cgColor]
        
        newlayer.frame = view.frame
        view.layer.insertSublayer(newlayer, at: 0)
        newlayer.startPoint = CGPoint(x:0,y:0)
        newlayer.endPoint = CGPoint(x:1,y:1)
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

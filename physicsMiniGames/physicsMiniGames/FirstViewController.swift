//
//  FirstViewController.swift
//  physicsMiniGames
//
//  Created by Ahmad Nizar on 25/04/19.
//  Copyright © 2019 Ahmad Nizar. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController{

    
    @IBOutlet var subjectsButtonCollection: [UIView] = []
    @IBOutlet weak var headerBox: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
     headerBoxGradientColor()
     buttonUiChange()
    
    }

    func headerBoxGradientColor(){
        let newlayer = CAGradientLayer()
        newlayer.frame = headerBox.bounds
        newlayer.colors = [UIColor(red: 0.58, green: 0.90, blue: 0.99, alpha: 1.0).cgColor, UIColor(red: 0.41, green: 0.74, blue: 1.0, alpha: 1.0).cgColor]
        
        newlayer.frame = headerBox.frame
        headerBox.layer.insertSublayer(newlayer, at: 0)
        newlayer.startPoint = CGPoint(x:0,y:0)
        newlayer.endPoint = CGPoint(x:1,y:1)    
    }


    func buttonUiChange(){
        for button in self.subjectsButtonCollection{
            button.layer.cornerRadius = 5
            
        }
    }
    @IBAction func subjectsButton(_ sender: UIButton) {
   
        print("\(String(describing: sender.titleLabel!.text))")
    }
    
}


//
//  FirstViewController.swift
//  physicsMiniGames
//
//  Created by Ahmad Nizar on 25/04/19.
//  Copyright © 2019 Ahmad Nizar. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class FirstViewController: UIViewController{

    var globalY: Int = 170
    @IBOutlet var subjectsButtonCollection: [UIView] = []
    @IBOutlet weak var headerBox: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
     headerBoxGradientColor()
       

        Alamofire.request( "http://10.60.48.159:3000/games/").responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                print("---------------------------\n",swiftyJsonVar,"--------------------------\n")
                
                for data in swiftyJsonVar{
                    print("================================\n",data.1["title"])
                    self.makeButton(name: data.1["title"])
                
                self.makeTitleLabel(name: data.1["title"])
                    self.makeDescriptionLabel(name: data.1["description"])
                 
                }
            }
        }

 
    }

    @IBOutlet weak var nameField: UILabel!
    func headerBoxGradientColor(){
        let newlayer = CAGradientLayer()
        newlayer.frame = headerBox.bounds
        newlayer.colors = [UIColor(red: 0.58, green: 0.90, blue: 0.99, alpha: 1.0).cgColor, UIColor(red: 0.41, green: 0.74, blue: 1.0, alpha: 1.0).cgColor]
        
        newlayer.frame = headerBox.frame
        headerBox.layer.insertSublayer(newlayer, at: 0)
        newlayer.startPoint = CGPoint(x:0,y:0)
        newlayer.endPoint = CGPoint(x:1,y:1)    

    }

    func makeButton(name: JSON){
        
        let btn: UIButton = UIButton(frame: CGRect(x: 37, y: globalY, width: 338, height: 80))
        btn.backgroundColor = UIColor.blue
        btn.setTitle(name.stringValue, for: .normal)
        btn.layer.cornerRadius = 5
        btn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        btn.tag = 1
        self.view.addSubview(btn)
        
    }
    func makeTitleLabel(name: JSON){
        globalY+=87
        let titleLabel: UILabel = UILabel(frame: CGRect(x: 37, y: globalY, width:150 , height: 24))
        
        titleLabel.text = name.stringValue
        titleLabel.textAlignment = .left
        titleLabel.backgroundColor = .clear
        titleLabel.numberOfLines = 1
        titleLabel.font =  UIFont.boldSystemFont(ofSize: 17.0)
        self.view.addSubview(titleLabel)
        
    }
    func makeDescriptionLabel(name: JSON){
        globalY+=28
        let descLabel: UILabel = UILabel(frame: CGRect(x: 37, y: globalY, width:339 , height: 24))
        
        descLabel.text = name.stringValue
        descLabel.textAlignment = .left
        descLabel.backgroundColor = .clear
        descLabel.numberOfLines = 2
        descLabel.font = UIFont.systemFont(ofSize: 15.0)
        self.view.addSubview(descLabel)
        globalY+=70
    }
    @objc func buttonAction(sender: UIButton!) {
        let btnsendtag: UIButton = sender
        if btnsendtag.tag == 1 {
            
            dismiss(animated: true, completion: nil)
        }
    }
//    @IBAction func subjectsButton(_ sender: UIButton) {
//
//        print("\(String(describing: sender.titleLabel!.text))")
//    }
    
}


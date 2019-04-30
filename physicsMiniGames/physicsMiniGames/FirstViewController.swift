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
    
    var data: Dictionary<Int, JSON> = [:]
    var activeTag: Int = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
     headerBoxGradientColor()
       

        Alamofire.request( "http://10.60.48.159:3000/games/").responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                print("---------------------------\n",swiftyJsonVar,"--------------------------\n")
                
                
                var tag = 0
                for data in swiftyJsonVar.makeIterator() {
                    tag += 1
                    print("================================\n",data.1["title"])
                    self.makeButton(name: data.1["title"], tag: tag)
                
                    self.makeTitleLabel(name: data.1["title"])
                    self.makeDescriptionLabel(name: data.1["description"])
                    
                    self.data[tag] = data.1
                 
                }
                
                print(self.data)
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

    func makeButton(name: JSON, tag: Int){
        
        let btn: UIButton = UIButton(frame: CGRect(x: 37, y: globalY, width: 338, height: 80))
        btn.backgroundColor = UIColor.blue
        btn.setTitle(name.stringValue, for: .normal)
        btn.layer.cornerRadius = 5
        btn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        btn.tag = tag
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
        self.activeTag = sender.tag
        performSegue(withIdentifier: "HomeToGame", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "HomeToGame" {
            let introGameController = segue.destination as! GameIntroViewController
            let data = self.data[self.activeTag]
        
            introGameController.gameData = data!
        }
    }
    
}


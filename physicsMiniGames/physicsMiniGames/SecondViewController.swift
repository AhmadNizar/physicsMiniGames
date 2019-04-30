//
//  SecondViewController.swift
//  physicsMiniGames
//
//  Created by Ahmad Nizar on 25/04/19.
//  Copyright © 2019 Ahmad Nizar. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SecondViewController: UIViewController {

    @IBOutlet weak var scoreTitle: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Alamofire.request(
            "http://10.60.48.159:3000/games/"
            ).responseData { responseData in
                if((responseData.result.value) != nil) {
                    let swiftyJsonVar = JSON(responseData.result.value!)
                    print(swiftyJsonVar)
                    
                    self.scoreTitle.text = swiftyJsonVar[0]["title"].string
                }
                
//                self.scoreTitle.text = responseData[0]["title"].string
                
        }
    }


}


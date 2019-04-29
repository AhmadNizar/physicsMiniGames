//
//  GameScoreViewController.swift
//  physicsMiniGames
//
//  Created by rshier on 29/04/19.
//  Copyright © 2019 Ahmad Nizar. All rights reserved.
//

import UIKit

class GameScoreViewController: UIViewController {

    var score: Int = 0
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLabel.text = "You got \(score) point(s)"
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

}

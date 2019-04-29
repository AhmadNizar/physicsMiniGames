//
//  IntroViewController.swift
//  physicsMiniGames
//
//  Created by rshier on 29/04/19.
//  Copyright © 2019 Ahmad Nizar. All rights reserved.
//

import UIKit
import YoutubePlayer_in_WKWebView

class IntroViewController: UIViewController {
    @IBOutlet weak var videoPlayer: WKYTPlayerView!
    @IBOutlet weak var gameLabel: UILabel!
    @IBOutlet weak var descriptionText: UITextView!
    
    var gameDescription: String = "Lorem ipsum dolor is er elit lamet"
    var gameTitle: String = "Game AIUEO"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        videoPlayer.load(withVideoId: "6qiYcyhI158")
        
        gameLabel.text = gameTitle
        descriptionText.text = gameDescription
        
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

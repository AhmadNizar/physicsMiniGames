//
//  GameIntroViewController.swift
//  physicsMiniGames
//
//  Created by rshier on 29/04/19.
//  Copyright © 2019 Ahmad Nizar. All rights reserved.
//

import UIKit
import YoutubePlayer_in_WKWebView
import SwiftyJSON

class GameIntroViewController: UIViewController {

    @IBOutlet weak var videoView: WKYTPlayerView!
    @IBOutlet weak var descLabel: UITextView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var gameTitle: String = "Title"
    var gameDesc: String = "Desc"
    var gameVideo: String = "id"
    var gameData: JSON = JSON()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = gameData["title"].stringValue
        descLabel.text = gameData["description"].stringValue
        videoView.load(withVideoId: gameData["video_url"].stringValue)
        

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

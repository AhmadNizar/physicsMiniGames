//
//  ThermoSlider.swift
//  physicsMiniGames
//
//  Created by rshier on 29/04/19.
//  Copyright © 2019 Ahmad Nizar. All rights reserved.
//

import UIKit

@IBDesignable
class ThermoSlider: UIView {

    @IBOutlet var slider: UISlider!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    func commonInit(){
        slider.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
    }
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

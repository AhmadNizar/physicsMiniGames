//
//  GradientView.swift
//  physicsMiniGames
//
//  Created by Hendy Sen on 26/04/19.
//  Copyright © 2019 Ahmad Nizar. All rights reserved.
//

import UIKit

@IBDesignable
class GradientView: UIView {
    
    @IBInspectable var FirstColor: UIColor = UIColor.clear {
        didSet{
            updateColor()
        }
    }
    @IBInspectable var SecondColor: UIColor = UIColor.clear {
        didSet{
            updateColor()
        }
    }
    override class var layerClass: AnyClass {
        get{
            return CAGradientLayer.self
            
        }
    }
    
    func updateColor() {
        let layer = self.layer as! CAGradientLayer
        
        layer.colors = [FirstColor.cgColor, SecondColor.cgColor]
        layer.startPoint = CGPoint(x: 0,y: 0)
        layer.endPoint = CGPoint(x: 1,y: 1)
    }
    
}

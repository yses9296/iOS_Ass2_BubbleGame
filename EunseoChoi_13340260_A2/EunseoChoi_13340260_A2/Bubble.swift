//
//  Bubble.swift
//  EunseoChoi_13340260_A2
//
//  Created by 최은서 on 2020/05/22.
//  Copyright © 2020 Eunseo Choi. All rights reserved.
//

import UIKit

class Bubble: UIButton {
   
    var value: Double = 1
    var radius: UInt32 {
        return UInt32(UIScreen.main.bounds.width / 12)
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.layer.cornerRadius = CGFloat(radius)

        let possibility = Int.random(in: 0...100)           // Int(arc4random_uniform(100))
        switch possibility {
        case 0...39:
            self.backgroundColor = UIColor.red
            self.value = 1
        case 40...69:
            self.backgroundColor = UIColor.systemPink
            self.value = 2
        case 70...84:
            self.backgroundColor = UIColor.green
            self.value = 5
        case 85...94:
            self.backgroundColor = UIColor.blue
            self.value = 8
        case 95...99:
            self.backgroundColor = UIColor.black
            self.value = 10
            
        default: print("error")
        }
    }
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
    
     func animation() {
        let animation = CASpringAnimation(keyPath: "transform.scale")
        animation.duration = 0.6
        animation.fromValue = 0.8
        animation.toValue = 1.0
        animation.repeatCount = 1
        animation.initialVelocity = 0.5
        animation.damping = 1
        animation.autoreverses = true
        
        layer.add(animation, forKey: nil)
    }
    
    func fadeAnimation(){
        let fadeAnimation = CABasicAnimation(keyPath: "opacity")
        fadeAnimation.fromValue = 0
        fadeAnimation.toValue = 2
        fadeAnimation.duration = 2.0
        fadeAnimation.repeatCount = 2.0
        fadeAnimation.autoreverses = true
        
        layer.add(fadeAnimation, forKey: nil)
    }
    
    
} 

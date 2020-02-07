//
//  MDSaveButtonAnimation.swift
//  Pure
//
//  Created by Mohammed Drame on 2/6/20.
//  Copyright © 2020 Mo Drame. All rights reserved.
//

import UIKit

extension  UIButton {

   
    
    
    // Animation
    
    func pulsate() {
          
          let pulse = CASpringAnimation(keyPath: "transform.scale")
//          pulse.duration = 0.6
          pulse.fromValue = 0.95
          pulse.toValue = 1.0
          pulse.autoreverses = true
        pulse.repeatCount = .infinity
          pulse.initialVelocity = 0.5
          pulse.damping = 1.0
          
          layer.add(pulse, forKey: "pulse")
      }
    
    // Styling

}

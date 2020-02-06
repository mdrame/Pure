//
//  ViewController.swift
//  Pure
//
//  Created by Mohammed Drame on 2/6/20.
//  Copyright © 2020 Mo Drame. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // MARK: -> View BackGroundColor.
        /// Background Color Base on specific unique colors patern
        self.view.backgroundColor = #colorLiteral(red: 0.1058706865, green: 0.1058889255, blue: 0.1058644727, alpha: 1)
        
//         motivationLabelSetUP()

        
       motivationLabelSetUP()
       
        
        
        
    }
    
    
    // MARK: -> UILabel
    
    lazy var motivationLabelContainer: UILabel = {
        let motivationLabel = UILabel()
        motivationLabel.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 0)
        motivationLabel.text = """
        Those who wish to achieve greatness, never seek for permissions. They follow what their heart says, and do what their mind states!
        """
        motivationLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        motivationLabel.font = UIFont(name: "AmericanTypewriter", size: 18)
        motivationLabel.textAlignment = .center
        
        motivationLabel.numberOfLines = 0
        
        
        motivationLabel.clipsToBounds = true
        motivationLabel.layer.cornerRadius = 10
        
        
        motivationLabel.translatesAutoresizingMaskIntoConstraints = false
    
        return motivationLabel
    }()
    
    
    


}


extension HomeViewController {
    
    
    /// This function establish the label that the quiote will be in, under this funcrtion will be the label constraints
    func motivationLabelSetUP() {
        
        
        // MARK: -> Adding motivation logo to view, and setting constraints.
            view.addSubview(motivationLabelContainer)
           NSLayoutConstraint.activate([
         
               // width, height constraints
            motivationLabelContainer.widthAnchor.constraint(equalToConstant: self.view.frame.size.width / 2 + self.view.frame.size.width / 3 ),
            motivationLabelContainer.heightAnchor.constraint(equalToConstant: self.view.frame.size.height / 4),
            // x, y constraints
                     motivationLabelContainer.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
                     motivationLabelContainer.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            // tralling and leading constraints
//            motivationLabelContainer.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
//            motivationLabelContainer.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0)
           ])
        
    }
    
    
    
    
}


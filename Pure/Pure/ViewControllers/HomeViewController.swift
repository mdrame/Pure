//
//  ViewController.swift
//  Pure
//
//  Created by Mohammed Drame on 2/6/20.
//  Copyright © 2020 Mo Drame. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    // MARK: -> Global Variables
    
    var dataSet = DataSet()
    
    
    // Dummy DataBase of Motivational quiotes
    //    var list: [String] = ["Whenever you're struggling to get things done, turn to this list of quotes for the inspiration and motivation you need to be the best you can be.", "You look at things you enjoy in your life, but much more important is what you can do to make the world a better place", "There have to be reasons that you get up in the morning and you want to live"]
    
    // random unique colors
    var colors: [String: UIColor] = ["red": .red, "pink": .systemPink, "blue": .blue ]
    
    
    
    // MARK: -> ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // MARK: -> View BackGroundColor.
        /// Background Color Base on specific unique colors patern
        self.view.backgroundColor = #colorLiteral(red: 0.06983517855, green: 0.07453668863, blue: 0.08315380663, alpha: 1)
        
        /// This function establish the label that the quiote will be in, under this funcrtion will be the label constraints
        motivationLabelSetUP()
        
        /// This function is cheking to see if our current quote have already ben used, if yes than we re-run the function to make sure we get a quote that hav'nt been used before.
        quoteSelectionSetting(arrayOfQuotes: dataSet.setQuotes() )
        
        ///this functio ncreates save button and assing constraints
        saveButtonSetUP()
        /// save button animation
        saveButton.pulsate()
        
        
        
    }
    
    
    // MARK: -> Global Function
    
    func quoteSelectionSetting(arrayOfQuotes ourList: Array<QuotesModel>) {
        // empty array of
        var usedQuote = [String]()
        var randomObject = Int.random(in: 0..<ourList.count)
        print("Random Quoit Selected: \(randomObject)")
        
        // looping over entire list of quotes.
        for _ in ourList {
            // checking to see if the selected quote havent already been used.
            if usedQuote.contains(ourList[randomObject].quote) {
                // re-randomized array and re-call this function.
                self.dataSet.quoteModel.shuffle()// shuffling our array because the quote selected have already been used.
                continue // re-running function.
            } else {
                // if quote have'nt alreay been used, update model with un-use quote.
                // porpulate model
                usedQuote.append(ourList[randomObject].quote)
                print("Selected Quote: \(usedQuote)")
                motivationLabelContainer.text = ourList[randomObject].quote
                
            }
        }
        
    }
    
    // Code from Paul Hudson -> Hacking with swift
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    
    
    // MARK: -> UILabel
    
    lazy var motivationLabelContainer: UILabel = {
        let motivationLabel = UILabel()
        motivationLabel.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 0)
        motivationLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5)
        // font to be change with an enums of fonts base on days / months.
        motivationLabel.font = UIFont(name: "Arial", size: 18)
        motivationLabel.textAlignment = .center
        
        motivationLabel.numberOfLines = 0
        
        
        motivationLabel.clipsToBounds = true
        motivationLabel.layer.cornerRadius = 10
        
        
        motivationLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return motivationLabel
    }()
    
    
    
    // MARK: -> UIButton
    
    lazy var saveButton: UIButton = {
        
        let  saveButton = UIButton(frame: .zero)
        saveButton.setTitle("Save", for: .normal)
        // Ask mutchell about mind relaxation color
        saveButton.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        saveButton.setTitleColor(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), for: UIControl.State.normal)
        saveButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        saveButton.addTarget(self, action: #selector(saveButonPressed), for: .touchUpInside)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        
        // styling
        saveButton.layer.cornerRadius =  50
        
        return saveButton
    }()
    
    
    @objc func saveButonPressed() {
        
        // save image to user device.
        print("Motivation save to user device...")
        
    }
    
    
    
    
    
}














extension HomeViewController {
    
    
    
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
    
    
    
    
    func saveButtonSetUP() {
        
        
        // MARK: -> Adding motivation logo to view, and setting constraints.
        view.addSubview(saveButton)
        
        NSLayoutConstraint.activate([
            
            // width, height constraints
            saveButton.widthAnchor.constraint(equalToConstant: 100),
            saveButton.heightAnchor.constraint(equalToConstant: 100),
            // x, y constraints
            //                saveButton.topAnchor.constraint(equalTo: motivationLabelContainer.topAnchor, constant: 400),
            // tralling and leading constraints
            //                saveButton.leadingAnchor.constraint(equalTo: self.motivationLabelContainer.leadingAnchor, constant: 200),
            saveButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -60),
            saveButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50)
        ])
        
    }
    
    
    
    
}


//
//  ViewController.swift
//  Pure
//
//  Created by Mohammed Drame on 2/6/20.
//  Copyright © 2020 Mo Drame. All rights reserved.
//

import UIKit
import UserNotifications

class HomeViewController: UIViewController {
    
    
    // MARK: -> Global Variables
    
    var dataSet = DataSet()
    /// Turing segmented control on and off base on the button press toggle switch ever time the button is pressed
    var buttonPress : Bool = true {
        willSet {
            segmentedControlContainer.isHidden = newValue
        }
    }
    
    
    
    // Dummy DataBase of Motivational quiotes
    //    var list: [String] = ["Whenever you're struggling to get things done, turn to this list of quotes for the inspiration and motivation you need to be the best you can be.", "You look at things you enjoy in your life, but much more important is what you can do to make the world a better place", "There have to be reasons that you get up in the morning and you want to live"]
    
    // random unique colors
    var colors: [String: UIColor] = ["red": .red, "pink": .systemPink, "blue": .blue ]
    
    
    
    // MARK: -> ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // MARK: -> View BackGroundColor.
        /// Background Color Base on specific unique colors patern / get Mechell input
        self.view.backgroundColor = #colorLiteral(red: 0.06983517855, green: 0.07453668863, blue: 0.08315380663, alpha: 1)
        
        /// this function adds the button to the view and set constraints
        timerButtonSetUP()
        
        
        segmentedControlSetUP()
        
        /// This function establish the label that the quiote will be in, under this funcrtion will be the label constraints
        motivationLabelSetUP()
        
        /// This function is cheking to see if our current quote have already ben used, if yes than we re-run the function to make sure we get a quote that hav'nt been used before.
        quoteSelectionSetting(arrayOfQuotes: dataSet.setQuotes() )
        
        ///this functio ncreates save button and assing constraints
        shareButtonConstraints()
        /// save button animation
        shareButtonContainer.pulsate()
        
        /// this function is creating notification base on user selected timmer or time zone.
        //        userNotification()
        
        
        
        
        
        
        
        
        
        
        
        
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
    
    // MARK: -> UNNotification UserNotification
    
    func userNotification() {
        // Notification class
        let center = UNUserNotificationCenter.current()
        center.removeAllPendingNotificationRequests()
        
        // Getting user approval
        center.requestAuthorization(options: [.alert, .badge, .sound]) { (isGranted, error) in
            if isGranted {
                print("Yay! User granded our notification")
            } else {
                print("Nope! User decline to show notification")
            }
        }
        
        // Adding content to notification class
        let content = UNMutableNotificationContent()
        //        content.title = "Motivation"
        content.body = "Keep your head up"
        content.categoryIdentifier = "Alarm"
        content.sound = .default
        
        // Triger for notification
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        
        
        // Combine identifier, content and trigger
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        // Add notification
        center.add(request)
        
    }
    
    
    
    // MARK: -> Status Bar
    // Code from Paul Hudson -> Hacking with swift
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    
    
    // MARK: -> VIEWS
    
    
    // MARK: -> Timing Button
    lazy var timerButtonContiner: UIButton = {
        let timerButton = UIButton(frame: .zero)
        //        timerButton.backgroundColor = .yellow
        timerButton.setImage(#imageLiteral(resourceName: "icons8-timer-100"), for: .normal)
        timerButton.adjustsImageSizeForAccessibilityContentSizeCategory = true
        timerButton.translatesAutoresizingMaskIntoConstraints = false
        timerButton.addTarget(self, action: #selector(timerButtonPress), for: .touchUpInside)
        
        // Styling
        timerButton.layer.shadowRadius = 10.0
        timerButton.layer.shadowColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        timerButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        //        timerButton.layer.shadowOpacity = 0.5;
        timerButton.layer.masksToBounds = true
        return timerButton
        
    }()
    
    // MARK: -> Timing Button Constraints
    
    @objc func timerButtonPress() {
        
        
        buttonPress.toggle()
        print("Segmented Bar is on: \(buttonPress)")
       
    }
    
    
    // Timer button setup and constraints
    func timerButtonSetUP() {
        view.addSubview(timerButtonContiner)
        
        // An array of constraints
        NSLayoutConstraint.activate(
            [
                timerButtonContiner.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                timerButtonContiner.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
                timerButtonContiner.widthAnchor.constraint(equalToConstant: view.frame.size.width / 7),
                timerButtonContiner.heightAnchor.constraint(equalToConstant: 59)
            ]
        )
    }
    
    // MARK: -> UISegmented Control
    /// This function establish and add the segmented control to the screen and set constraints
    lazy var segmentedControlContainer: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Morning", "Noone", "Night"])
       
        segmentedControl.backgroundColor = #colorLiteral(red: 0.8999300599, green: 0, blue: 0.2961923778, alpha: 1)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.selectedSegmentTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        segmentedControl.isHidden = true // Hide segmented control as screen startes
        segmentedControl.translatesAutoresizingMaskIntoConstraints =  false
        return segmentedControl
        
    }()
    
    
    
    
    func segmentedControlSetUP() {
        view.addSubview(segmentedControlContainer)
         
        NSLayoutConstraint.activate([
            // Center in view
//            segmentedControlContainer.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            segmentedControlContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            // Top Acher
            segmentedControlContainer.topAnchor.constraint(equalTo: timerButtonContiner.topAnchor, constant: 0 ),
            // width and height
            segmentedControlContainer.widthAnchor.constraint(equalToConstant: view.frame.size.width / 2),
            segmentedControlContainer.heightAnchor.constraint(equalToConstant: 40)
            
        ])
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
    
    lazy var shareButtonContainer: UIButton = {
        
        let  shareButton = UIButton(frame: .zero)
        shareButton.setTitle("Share", for: .normal)
        // Ask mutchell about mind relaxation color
        shareButton.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        shareButton.setTitleColor(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), for: UIControl.State.normal)
        shareButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        shareButton.addTarget(self, action: #selector(shareButtonPress), for: .touchUpInside)
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        
        // styling
        shareButton.layer.cornerRadius =  50
        
        
        return shareButton
    }()
    
    // This function share the current Motivation quote.
    @objc func shareButtonPress() {
        
        // save image to user device.
        let activityController = UIActivityViewController(activityItems: ["My name is Mohammed"], applicationActivities: [])
        present(activityController, animated: true, completion: nil)
        
    }
    
    
    // share button swetup and constratinsts
    func shareButtonConstraints() {
        
        
        // MARK: -> Adding motivation logo to view, and setting constraints.
        view.addSubview(shareButtonContainer)
        
        NSLayoutConstraint.activate([
            
            // width, height constraints
            shareButtonContainer.widthAnchor.constraint(equalToConstant: 100),
            shareButtonContainer.heightAnchor.constraint(equalToConstant: 100),
            // x, y constraints
            //                saveButton.topAnchor.constraint(equalTo: motivationLabelContainer.topAnchor, constant: 400),
            // tralling and leading constraints
            //                saveButton.leadingAnchor.constraint(equalTo: self.motivationLabelContainer.leadingAnchor, constant: 200),
            shareButtonContainer.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -60),
            shareButtonContainer.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50)
        ])
        
    }
    
    
    
    
    
}














extension HomeViewController {
    
    
    // Motivation label setup and constraints
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


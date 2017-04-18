//
//  IntroContentView.swift
//  WaterRemind
//
//  Created by winslowdibona on 4/18/17.
//  Copyright © 2017 winslowdibona. All rights reserved.
//

import UIKit
import EasyPeasy
import FontAwesome_swift

protocol IntroContentViewDelegate {
    func pushedContinue()
    func selectedReminderFrequency(minutes: Int)
    func selectedLocationReminder(yes: Bool)
}


class IntroContentView: UIView {
    
    var views: [UIView] = []
    var index: Int = 0
    var delegate: IntroContentViewDelegate?
    
    override func didMoveToSuperview() {
        backgroundColor = Color.blue
    }
    
    func continuePressed() {
        delegate?.pushedContinue()
    }
    
    func setIndex(index: Int) {
        switch index {
        case 0: setupIntro()
        case 1: setupReminders()
        case 2: setupGeofence()
        case 3: setupNotificationPermissions()
        default: break
        }
    }
    
    func selectedReminderFrequency(sender: UIButton) {
        if let frequencyString = sender.titleLabel?.text {
            print("Selected - \(frequencyString)")
            switch frequencyString {
            case "Every 2 hours": delegate?.selectedReminderFrequency(minutes: 120)
            case "Hourly": delegate?.selectedReminderFrequency(minutes: 60)
            case "Every 30 min": delegate?.selectedReminderFrequency(minutes: 30)
            default: break
            }
        }
    }
    
    func selectedLocationReminder(sender: UIButton) {
        if let title = sender.titleLabel?.text {
            switch title {
            case "Yes": delegate?.selectedLocationReminder(yes: true)
            case "No": delegate?.selectedLocationReminder(yes: false)
            default: break
            }
        }
    }
    
    func setupIntro() {
        let view = UIView()
        view.backgroundColor = Color.blue
        let label1 = UILabel(font: UIFont(name: "Helvetica", size: 20)!, text: "This app reminds you to drink water")
        let bell = UIImage.fontAwesomeIcon(name: .bellO, textColor: Color.grey, size: CGSize(width: 50, height: 50))
        let bellView = UIImageView(frame: .zero)
        bellView.image = bell
        let label2 = UILabel(font: UIFont(name: "Helvetica", size: 15)!, text: "Regular Reminders", color: Color.grey)
        let poop = UIImage.fontAwesomeIcon(name: .locationArrow, textColor: Color.grey, size: CGSize(width: 50, height: 50))
        let poopView = UIImageView(frame: .zero)
        poopView.image = poop
        let label3 = UILabel(font: UIFont(name: "Helvetica", size: 15)!, text: "Location based reminders", color: Color.grey)
        let button = UIButton(type: .system)
        button.backgroundColor = Color.grey
        button.setTitle("Continue", for: .normal)
        button.setTitleColor(Color.black, for: .normal)
        button.addTarget(self, action: #selector(continuePressed), for: .touchUpInside)
        
        addSubview(view)
        view <- [Left(0), Right(0), Top(0), Bottom(0)]
        
        view.addSubview(bellView)
        view.addSubview(poopView)
        view.addSubview(button)
        view.addSubview(label1)
        view.addSubview(label2)
        view.addSubview(label3)
        
        label1 <- [Left(10), Right(10), Top(20), Height(25)]
        bellView <- [Top(15).to(label1, .bottom), Size(50), CenterX(0)]
        label2 <- [Left(10), Right(10), Top(5).to(bellView, .bottom), Height(20)]
        poopView <- [Top(15).to(label2, .bottom), Size(50), CenterX(0)]
        label3 <- [Left(10), Right(10), Top(5).to(poopView, .bottom), Height(20)]
        button <- [Left(10), Right(10), Top(15).to(label3, .bottom), Height(50)]
        views.append(view)
        
    }
    
    func setupReminders() {
        let button1 = UIButton(type: .system)
        button1.backgroundColor = Color.grey
        button1.setTitle("Every 2 hours", for: .normal)
        button1.setTitleColor(Color.black, for: .normal)
        button1.addTarget(self, action: #selector(selectedReminderFrequency(sender:)), for: .touchUpInside)
        
        let button2 = UIButton(type: .system)
        button2.backgroundColor = Color.grey
        button2.setTitle("Hourly", for: .normal)
        button2.setTitleColor(Color.black, for: .normal)
        button2.addTarget(self, action: #selector(selectedReminderFrequency(sender:)), for: .touchUpInside)
        
        let button3 = UIButton(type: .system)
        button3.backgroundColor = Color.grey
        button3.setTitle("Every 30 min", for: .normal)
        button3.setTitleColor(Color.black, for: .normal)
        button3.addTarget(self, action: #selector(selectedReminderFrequency(sender:)), for: .touchUpInside)
        
        let view = UIView(frame: .zero)
        view.backgroundColor = Color.blue
        
        addSubview(view)
        view <- [Left(bounds.width), Right(-bounds.width), Top(0), Bottom(0)]
        
        view.addSubview(button1)
        view.addSubview(button2)
        view.addSubview(button3)
        
        button1 <- [Left(10), Right(10), Top(20), Height(50)]
        button2 <- [Left(10), Right(10), Top(20).to(button1, .bottom), Height(50)]
        button3 <- [Left(10), Right(10), Top(20).to(button2, .bottom), Height(50)]
        self.layoutIfNeeded()
        
        views.append(view)
        
        UIView.animate(withDuration: 0.3, animations: { 
            self.views[0] <- [Left(-self.bounds.width), Right(self.bounds.width), Top(0), Bottom(0)]
            self.views[1] <- [Left(0), Right(0), Top(0), Bottom(0)]
            self.layoutIfNeeded()
        }) { (complete) in
            
        }
    }
    
    func setupGeofence() {
        let label = UILabel(font: UIFont(name:"Helvetica", size: 20)!, text: "We can notify you when your leaving in the morning to make sure you have your water bottle")
        let button = UIButton(type: .system)
        button.setTitle("Yes", for: .normal)
        button.setTitleColor(Color.black, for: .normal)
        button.backgroundColor = Color.grey
        button.addTarget(self, action: #selector(selectedLocationReminder(sender:)), for: .touchUpInside)
        
        let button2 = UIButton(type: .system)
        button2.setTitle("No", for: .normal)
        button2.setTitleColor(Color.black, for: .normal)
        button2.backgroundColor = Color.grey
        button2.addTarget(self, action: #selector(selectedLocationReminder(sender:)), for: .touchUpInside)
        
        let view = UIView(frame: .zero)
        addSubview(view)
        view <- [Left(bounds.width), Right(-bounds.width), Top(0), Bottom(0)]
        
        view.addSubview(label)
        view.addSubview(button)
        view.addSubview(button2)
        
        
        label <- [Left(10), Right(10), Top(20), Height(100)]
        button <- [Left(10), Right(10), Top(20).to(label, .bottom), Height(50)]
        button2 <- [Left(10), Right(10), Top(20).to(button, .bottom), Height(50)]
        
        
        views.append(view)
        self.layoutIfNeeded()
        
        UIView.animate(withDuration: 0.3, animations: { 
            self.views[1] <- [Left(-self.bounds.width), Right(self.bounds.width), Top(0), Bottom(0)]
            self.views[2] <- [Left(0), Right(0), Top(0), Bottom(0)]
            self.layoutIfNeeded()
        }) { (complete) in
            
        }
    }
    
    func setupNotificationPermissions() {
        
    }

}

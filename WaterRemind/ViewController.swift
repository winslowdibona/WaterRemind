//
//  ViewController.swift
//  WaterRemind
//
//  Created by winslowdibona on 4/14/17.
//  Copyright © 2017 winslowdibona. All rights reserved.
//

import UIKit
import EasyPeasy

class ViewController: UIViewController {
    
    var scheduleButton: UIButton!
    var locationButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Color.red
        
        locationButton = UIButton(type: .system)
        locationButton.setTitle("Set Location Reminder", for: .normal)
        locationButton.setTitleColor(Color.white, for: .normal)
        locationButton.layer.borderColor = Color.blue.cgColor
        locationButton.layer.borderWidth = 2
        locationButton.layer.masksToBounds = false
        
        scheduleButton = UIButton(type: .system)
        scheduleButton.setTitle("Schedule Notifications", for: .normal)
        scheduleButton.setTitleColor(Color.blue, for: .normal)
        scheduleButton.layer.borderColor = Color.blue.cgColor
        scheduleButton.layer.masksToBounds = false
        scheduleButton.layer.borderWidth = 2
        
        view.addSubview(locationButton)
        view.addSubview(scheduleButton)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        locationButton <- [Left(50), Bottom(50), Size(100)]
        scheduleButton <- [Right(50), Bottom(50), Size(100)]
        view.layoutIfNeeded()
    }
}


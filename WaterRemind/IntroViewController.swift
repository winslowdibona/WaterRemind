//
//  IntroViewController.swift
//  WaterRemind
//
//  Created by winslowdibona on 4/14/17.
//  Copyright © 2017 winslowdibona. All rights reserved.
//

import UIKit
import EasyPeasy

class IntroViewController: UIViewController {
    
    var headerView: IntroHeaderView!
    var contentView: IntroContentView!
    var index: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Color.red
        headerView = IntroHeaderView()
        contentView = IntroContentView()
        contentView.delegate = self
        view.addSubview(headerView)
        view.addSubview(contentView)
        
        headerView <- [Left(0), Right(0), Top(0).to(topLayoutGuide, .bottom), Height(175)]
        contentView <- [Left(0), Right(0), Top(0).to(headerView, .bottom), Bottom(0).to(bottomLayoutGuide, .top)]
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        headerView.setup()
        headerView.setIndex(index: 0)
        contentView.setIndex(index: 0)
    }
}

extension IntroViewController: IntroContentViewDelegate {
    
    func selectedLocationReminder(yes: Bool) {
        if yes {
            LocationManager.shared.requestAuth(callback: { (access) in
                if access {
                    
                } else {
                    
                }
            })
            let mapViewController = MapViewController()
            mapViewController.delegate = self
            self.present(mapViewController, animated: true, completion: nil)
        } else {
            next()
        }
    }
    
    func pushedContinue() {
        next()
    }
    
    func selectedReminderFrequency(minutes: TimeInterval) {
        let trigger = NotificationTriggerType.time(timeInterval: minutes)
        NotificationManager.scheduleNotification(triggerType: trigger, title: "Drink Water", body: "Drink Water")
        next()
    }
    
    func next() {
        index = index + 1
        headerView.setIndex(index: index)
        contentView.setIndex(index: index)
    }
}


extension IntroViewController: MapViewControllerDelegate {
    func dismiss(mapViewController: MapViewController) {
        mapViewController.dismiss(animated: true) { 
            UserDefaults.standard.set(true, forKey: "setup")
            if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
                appDelegate.window?.rootViewController = ViewController()
            }
        }
    }
}

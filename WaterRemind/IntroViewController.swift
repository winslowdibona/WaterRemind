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
        //self.present(MapViewController(), animated: true, completion: nil)
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
            self.present(MapViewController(), animated: true, completion: nil)
        } else {
            next()
        }
    }
    
    func pushedContinue() {
        next()
    }
    
    func selectedReminderFrequency(minutes: Int) {
        next()
    }
    
    func next() {
        index = index + 1
        headerView.setIndex(index: index)
        contentView.setIndex(index: index)
    }
}

//
//  ScheduleNotificationsViewController.swift
//  WaterRemind
//
//  Created by winslowdibona on 4/25/17.
//  Copyright © 2017 winslowdibona. All rights reserved.
//

import UIKit

protocol ScheduleNotificationsViewControllerDelegate {
    func dismiss(viewController: ScheduleNotificationsViewController)
}

class ScheduleNotificationsViewController: UIViewController {
    
    var delegate: ScheduleNotificationsViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

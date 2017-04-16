//
//  Extensions.swift
//  WaterRemind
//
//  Created by winslowdibona on 4/15/17.
//  Copyright © 2017 winslowdibona. All rights reserved.
//

import Foundation
import UserNotifications

extension DateComponents {
    init(hour: Int, minute: Int) {
        self.init()
        self.hour = hour
        self.minute = minute
    }
}

extension UNMutableNotificationContent {
    convenience init(title: String, body: String, sound: UNNotificationSound = UNNotificationSound.default()) {
        self.init()
        self.title = title
        self.body = body
        self.sound = sound
    }
}

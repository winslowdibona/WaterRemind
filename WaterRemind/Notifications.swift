//
//  Notifications.swift
//  WaterRemind
//
//  Created by winslowdibona on 4/14/17.
//  Copyright © 2017 winslowdibona. All rights reserved.
//

import Foundation
import UserNotifications

struct Notifications {
    
    static func requestAuth(callback: @escaping (Bool) -> Void) {
        let center = UNUserNotificationCenter.current()
        let options: UNAuthorizationOptions = [.alert, .sound]
        center.requestAuthorization(options: options) { (granted, error) in
            if !granted {
                print("Didnt get notification permission")
            }
            callback(granted)
        }
    }
    
}

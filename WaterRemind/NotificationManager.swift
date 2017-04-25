//
//  NotificationManager.swift
//  WaterRemind
//
//  Created by winslowdibona on 4/15/17.
//  Copyright © 2017 winslowdibona. All rights reserved.
//

import Foundation
import UserNotifications

class NotificationManager: NSObject {
    
    static let shared = NotificationManager()
    
    private override init() {
        super.init()
        UNUserNotificationCenter.current().delegate = self
    }
}

extension NotificationManager : UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
    }
}


extension NotificationManager {
    
    class func scheduleNotification(triggerType: NotificationTriggerType, title: String, body: String) {
        let content = UNMutableNotificationContent(title: title, body: body)
        let request = UNNotificationRequest(identifier: "Identifier", content: content, trigger: triggerType.createTrigger())
        let center = UNUserNotificationCenter.current()
        center.add(request) { (error) in
            if let error = error {
                log.error("Error scheduling notification - \(error)")
            } else {
                print("Scheduled notification")
            }
        }
    }
    
    class func requestAuth(callback: @escaping (Bool) -> Void) {
        let center = UNUserNotificationCenter.current()
        let options: UNAuthorizationOptions = [.alert, .sound]
        center.requestAuthorization(options: options) { (granted, error) in
            if !granted {
                log.error("Didnt get notification permission")
            }
            callback(granted)
        }
    }
}

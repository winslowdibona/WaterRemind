//
//  NotificationTriggerType.swift
//  WaterRemind
//
//  Created by winslowdibona on 4/15/17.
//  Copyright © 2017 winslowdibona. All rights reserved.
//

import Foundation
import UserNotifications
import CoreLocation


enum NotificationTriggerType {
    case calendar(hour: Int, min: Int)
    case time(timeInterval: TimeInterval)
    case location(coordinate: CLLocationCoordinate2D, radius: CLLocationDistance)
    
    func createTrigger() -> UNNotificationTrigger {
        switch self {
        case .calendar(let hour, let min):
            let dateComponents = DateComponents(hour: hour, minute: min)
            return UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        case .time(let timeInterval):
            return UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
        case .location(let coordinate, let radius):
            let region = CLCircularRegion(center: coordinate, radius: radius, identifier: "NotificationRegion")
            region.notifyOnEntry = true
            region.notifyOnExit = true
            return UNLocationNotificationTrigger(region: region, repeats: false)
        }
    }
}

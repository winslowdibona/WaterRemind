//
//  Extensions.swift
//  WaterRemind
//
//  Created by winslowdibona on 4/15/17.
//  Copyright © 2017 winslowdibona. All rights reserved.
//

import Foundation
import UserNotifications
import UIKit

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

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}


extension UILabel {
    convenience init(font: UIFont, textAlignment: NSTextAlignment = .center, text: String? = nil, color: UIColor = Color.white) {
        self.init()
        self.numberOfLines = 0
        self.textAlignment = textAlignment
        self.font = font
        self.text = text
        self.textColor = color
    }
}

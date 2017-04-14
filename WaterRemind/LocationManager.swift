//
//  LocationManager.swift
//  WaterRemind
//
//  Created by winslowdibona on 4/14/17.
//  Copyright © 2017 winslowdibona. All rights reserved.
//

import Foundation
import CoreLocation


class LocationManager {
    
    static let shared = LocationManager()
    
    private var locationManager: CLLocationManager!
    
    private init() {
        locationManager = CLLocationManager()
    }
    
    func requestAuth(callback: (Bool) -> Void) {
        let status = CLLocationManager.authorizationStatus()
        if status ==  CLAuthorizationStatus.notDetermined {
            locationManager.requestAlwaysAuthorization()
        } else if status == CLAuthorizationStatus.denied || status == CLAuthorizationStatus.restricted {
            
        } else {
            callback(true)
        }
    }
    
}

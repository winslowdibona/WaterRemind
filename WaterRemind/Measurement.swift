//
//  Measurement.swift
//  WaterRemind
//
//  Created by winslowdibona on 4/16/17.
//  Copyright © 2017 winslowdibona. All rights reserved.
//

import Foundation
import RealmSwift

class Measurement: Object {
    dynamic var id: String = ""
    dynamic var name: String = ""
    dynamic var abbreviation: String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

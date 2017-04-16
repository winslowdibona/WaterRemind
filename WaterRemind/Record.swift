//
//  Record.swift
//  WaterRemind
//
//  Created by winslowdibona on 4/16/17.
//  Copyright © 2017 winslowdibona. All rights reserved.
//

import Foundation
import RealmSwift


class Record: Object {
    dynamic var id: String = ""
    dynamic var date: Date?
    dynamic var amount: String?
    dynamic var measurementId: String?
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

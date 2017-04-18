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

extension Record {
    class func create(date: Date?, amount: String?, measurementId: String?) -> Record? {
        let record = Record()
        record.id = UUID().uuidString
        record.date = date
        record.amount = amount
        record.measurementId = measurementId
        if DataManager.shared.save(object: record) {
            return record
        } else {
            return nil
        }
    }
}

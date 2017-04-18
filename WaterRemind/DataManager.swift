//
//  DataManager.swift
//  WaterRemind
//
//  Created by winslowdibona on 4/16/17.
//  Copyright © 2017 winslowdibona. All rights reserved.
//

import Foundation
import RealmSwift

enum SortType {
    case ascending(sortKey: String)
    case descending(sortKey: String)
    case none
}

enum QueryType {
    case record(query: String, sort: SortType)
    case measurement(query: String, sort: SortType)
    
    var realmObjectType: Object.Type {
        switch self {
        case .record: return Record.self
        case .measurement: return Measurement.self
        }
    }
    
    var predicateQuery: String {
        switch self {
        case .record(let query, _): return query
        case .measurement(let query, _): return query
        }
    }
    
    var sortType: SortType {
        switch self {
        case .record(_, let sort): return sort
        case .measurement(_, let sort): return sort
        }
    }
}


class DataManager: NSObject {
    
    static let shared = DataManager()
    
    var mainRealm: Realm?
    var backgroundRealm: Realm?
    
    override private init() {
        super.init()
        self.mainRealm = DataManager.createRealm()
        DispatchQueue.global(qos: .background).sync {
            self.backgroundRealm = DataManager.createRealm()
        }
    }
    
    func query(queryType: QueryType) -> [Object] {
        if let realm = mainRealm {
            let objects = realm.objects(queryType.realmObjectType)
            let results = objects.filter(queryType.predicateQuery)
            switch queryType.sortType {
            case .ascending(let sortKey): return results.sorted(byKeyPath: sortKey, ascending: true).map({return $0}) as [Object]
            case .descending(let sortKey): return results.sorted(byKeyPath: sortKey, ascending: false).map({return $0}) as [Object]
            case .none: return results.map({return $0}) as [Object]
            }
        }
        return []
    }
    
    func save(object: Object) -> Bool {
        if let realm = mainRealm {
            do {
                try realm.write {
                    realm.add(object)
                }
                return true
            } catch {
                log.error("Error creating object - \(object)")
            }
        }
        return false
    }
}


extension DataManager {
    class func createRealm() -> Realm? {
        do {
            let realm = try Realm()
            return realm
        } catch {
            print("Error creating Realm = \(error)")
            return nil
        }
    }
}

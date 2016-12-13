//
//  LedManager.swift
//  EasyLED
//
//  Created by imac on 28/11/2016.
//  Copyright © 2016 laurent. All rights reserved.
//

import Foundation
import RealmSwift

class LedManager {
    private let _ledList:Results<Led>
    private let _realm:Realm
    
    init(withRealm realm:Realm) {
        _realm = realm
        _ledList = _realm.objects(Led.self).sorted(byProperty: "_name")
    }
    
    public func getIndex(forLed led:Led) -> Int? {
        return _ledList.index(of: led)
    }
    
    public func getLed(atIndex index:Int) -> Led?{
        var led:Led?
        if index >= 0 && index<_ledList.count {
            led = _ledList[index]
        }
        return led
    }
    
    public func getNbLed() -> Int {
        return _ledList.count
    }
}

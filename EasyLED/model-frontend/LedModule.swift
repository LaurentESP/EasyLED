//
//  LedModule.swift
//  EasyLED
//
//  Created by imac on 28/11/2016.
//  Copyright © 2016 laurent. All rights reserved.
//

import Foundation
import RealmSwift

class LedModule{
    
    private var _realm:Realm?
    // Name
    private dynamic var _name:String = ""
    // [Led]
    private var _ledManager:LedManager?
    // [Sensor]
    private var _sensorManager:SensorManager?
    
    init(withRealm realm:Realm) {
        _realm = realm
        _ledManager = LedManager(withRealm: realm)
        _sensorManager = SensorManager(withRealm: realm)
    }
    
    public func getSensorManager() -> SensorManager? {
        return _sensorManager
    }
    
    public func setSensorManager(withSensorManager sensorManager:SensorManager) {
        _realm?.beginWrite()
        _sensorManager = sensorManager
        try! _realm?.commitWrite()
    }
    
    public func getLedManager() -> LedManager? {
        return _ledManager
    }
    
    public func setLedManager(withLedManager ledManager:LedManager) {
        _realm?.beginWrite()
        _ledManager = ledManager
        try! _realm?.commitWrite()
    }
}

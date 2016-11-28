//
//  SensorManager.swift
//  EasyLED
//
//  Created by imac on 28/11/2016.
//  Copyright © 2016 laurent. All rights reserved.
//

import Foundation
import RealmSwift

class SensorManager{
    private let _sensorList:Results<Sensor>
    private let _realm:Realm
    
    init(withRealm realm:Realm) {
        _realm = realm
        _sensorList = _realm.objects(Sensor.self).sorted(byProperty: "_name")
    }
    
    func getIndex(forSensor sensor:Sensor) -> Int? {
        return _sensorList.index(of: sensor)
    }
    
    func getSensorCount() -> Int {
        return _sensorList.count
    }
    
    func getSensor(atIndex index:Int) -> Sensor?{
        var sensor:Sensor?
        if index >= 0 && index < _sensorList.count {
            sensor = _sensorList[index]
        }
        return sensor
    }
    
    
}

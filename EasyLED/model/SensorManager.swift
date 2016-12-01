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
    private let _sensorTemperatureList:Results<SensorTemperature>
    private let _sensorFluxList:Results<SensorFlux>
    private let _realm:Realm
    
    init(withRealm realm:Realm) {
        _realm = realm
        _sensorTemperatureList = _realm.objects(SensorTemperature.self).sorted(byProperty: "_name")
        _sensorFluxList = _realm.objects(SensorFlux.self).sorted(byProperty: "_name")
    }
    
    //Temperature Sensors Management
    func getIndexTemp(forSensorTemp sensorTemp:SensorTemperature) -> Int? {
        return _sensorTemperatureList.index(of: sensorTemp)
    }
    
    func getSensorTemperatureCount() -> Int {
        return _sensorTemperatureList.count
    }
    
    func getSensorTemperature(atIndex index:Int) -> SensorTemperature?{
        var sensorTemp:SensorTemperature?
        if index >= 0 && index < _sensorTemperatureList.count {
            sensorTemp = _sensorTemperatureList[index]
        }
        return sensorTemp
    }
    
    func addSensorTemperature(withTemperatureSensor tempSensor:SensorTemperature) {
        try! _realm.write {
            _realm.add(tempSensor)
        }
    }
    
    func deleteSensorTemperature(atIndex index:Int) {
        if let sensorTemp = getSensorTemperature(atIndex: index) {
            try! _realm.write {
                _realm.delete(sensorTemp)
            }
        }
    }
    
    //Flux Sensors Management
    
    func getIndexFlux(forSensorFlux sensorFlux:SensorFlux) -> Int? {
        return _sensorFluxList.index(of: sensorFlux)
    }
    
    func getSensorFluxCount() -> Int {
        return _sensorFluxList.count
    }
    
    func getSensorFlux(atIndex index:Int) -> SensorFlux?{
        var sensorFlux:SensorFlux?
        if index >= 0 && index < _sensorFluxList.count {
            sensorFlux = _sensorFluxList[index]
        }
        return sensorFlux
    }
    
    func addSensorFlux(withFluxSensor fluxSensor:SensorFlux) {
        try! _realm.write {
            _realm.add(fluxSensor)
        }
    }
    
    func deleteSensorFlux(atIndex index:Int) {
        if let sensorFlux = getSensorFlux(atIndex: index) {
            try! _realm.write {
                _realm.delete(sensorFlux)
            }
        }
    }

    
}

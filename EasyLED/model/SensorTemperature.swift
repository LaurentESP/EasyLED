//
//  SensorTemperature.swift
//  EasyLED
//
//  Created by imac on 28/11/2016.
//  Copyright © 2016 laurent. All rights reserved.
//

import Foundation
import RealmSwift

class SensorTemperature: Sensor {
    private var _temperatures = List<Temperature>()
    
    
    public func addTemperature(forTemperature temp:Temperature) {
        _temperatures.append(temp)
    }
    
    public func getTemperatures()-> List<Temperature>{
        return _temperatures
    }
    
    public func getTemperature(atDate date:Int) -> Temperature? {
        var temperature:Temperature?
        for i in 0..<_temperatures.count {
            if _temperatures[i].getDate() == date {
                temperature = _temperatures[i]
            }
        }
        return temperature
    }
}

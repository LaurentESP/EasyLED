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
    private dynamic var _temperatures:[Temperature] = []
    
    public func addTemperature(forTemperature temp:Temperature) {
        _temperatures.append(temp)
    }
    
    public func getTemperatures()-> [Temperature]{
        return _temperatures
    }
}

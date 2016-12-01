//
//  SensorLuminous.swift
//  EasyLED
//
//  Created by imac on 30/11/2016.
//  Copyright © 2016 laurent. All rights reserved.
//

import Foundation
import RealmSwift

class SensorFlux: Object {
    
    private static let typeOfSensor = "Flux"
    private var _luminousFlux = List<LuminousFlux>()

    private dynamic var _name:String = ""
    
    public func setName(withName name:String) {
        realm?.beginWrite()
        _name = name
        try! realm?.commitWrite()
    }
    
    public func getName() -> String {
        return _name
    }
}

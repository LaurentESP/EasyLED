//
//  Sensor.swift
//  EasyLED
//
//  Created by imac on 28/11/2016.
//  Copyright © 2016 laurent. All rights reserved.
//

import Foundation
import RealmSwift

protocol sensorProtocol {
    var name:String {get set}
}

extension sensorProtocol{
    var name:String
        {
        get{
            return self.name
        }
        set {
            name = newValue
        }
    }
}

class Sensor:Object{
    
    // Name
    private dynamic var _name:String = ""
    private dynamic var _type:String = ""
    
    public func setName(withName name:String){
        realm?.beginWrite()
        _name = name
        try! realm?.commitWrite()
    }
    
    public func getName() -> String {
        return _name
    }
    
    public func setType(withType type:String){
        realm?.beginWrite()
        _type = type
        try! realm?.commitWrite()
    }
    
    public func getType() -> String {
        return _type
    }
    
    
    //let ledModule = LinkingObjects(fromType: LedModule.self, property: "_sensors")
}

//
//  Led.swift
//  EasyLED
//
//  Created by imac on 28/11/2016.
//  Copyright © 2016 laurent. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

protocol Meta {
    static func url() -> String
}

class Led:Object,Mappable,Meta{
    private dynamic var _name:String = ""
    private dynamic var _power:Float = 0
    //let ledModule = LinkingObjects(fromType: LedModule.self, property: "_leds")
    
    public func setName (withName name:String) {
        realm?.beginWrite()
        _name = name
        try! realm?.commitWrite()
    }
    
    public func setPower(forPow power:Float) {
        realm?.beginWrite()
        _power = power
        try! realm?.commitWrite()
    }
    
    public func getName() -> String {
        return _name
    }
    public func getPower() -> Float {
        return _power
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        _name <- map ["name"]
        _power <- map ["power"]
    }
    
    static func url() -> String {
        return "http://localhost:3000/leds"
    }
}

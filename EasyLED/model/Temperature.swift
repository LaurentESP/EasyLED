//
//  Temperature.swift
//  EasyLED
//
//  Created by imac on 28/11/2016.
//  Copyright © 2016 laurent. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

class Temperature:Object, Mappable,Meta {
    // {K or C}
    //private dynamic var
    // Value
    private dynamic var _value:Float = 0
    private dynamic var _date:Int = 0
    
    public func setTempVal(forValue val:Float, forDate date:Int) {
        realm?.beginWrite()
        _value = val
        _date = date
        try! realm?.commitWrite()
    }
    
    public func getTempValue() -> Float{
        return _value
    }
    
    public func getDate() -> Int{
        return _date
    }
    
    static public func ==(lhs: Temperature, rhs: Temperature) -> Bool {
        return lhs._date == rhs._date && lhs._value == rhs._value
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        guard let other = object as? Temperature else { return false }
        return self == other
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        _value <- map["value"]
        _date <- map["date"]
    }
    
    static func url() -> String {
        return "http://localhost:3000/temperatures"
    }
}

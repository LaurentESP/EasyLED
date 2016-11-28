//
//  Temperature.swift
//  EasyLED
//
//  Created by imac on 28/11/2016.
//  Copyright © 2016 laurent. All rights reserved.
//

import Foundation
import RealmSwift

class Temperature:Object {
    // {K or C}
    //private dynamic var
    // Value
    private dynamic var _value:Float = 0
    // Date
    private dynamic var _date:Int = 0
    
    public func setValue(forVal val:Float, forDate date:Int) {
        realm?.beginWrite()
        _value = val
        _date = date
        try! realm?.commitWrite()
    }
    
    public func getValue() -> Float{
        return _value
    }
    
    public func getDate() -> Int{
        return _date
    }
}

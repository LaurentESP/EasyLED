//
//  LedModule.swift
//  EasyLED
//
//  Created by imac on 28/11/2016.
//  Copyright © 2016 laurent. All rights reserved.
//

import Foundation
import RealmSwift

class LedModule:Object {
    
    // Name
    private dynamic var _name:String = ""
    // [Led]
    private var _leds:List<Led> = List<Led>()
    // [Sensor]
    private var _sensors:List<Sensor> = List<Sensor>()
    
    
    
}

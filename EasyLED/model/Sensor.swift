//
//  Sensor.swift
//  EasyLED
//
//  Created by imac on 28/11/2016.
//  Copyright © 2016 laurent. All rights reserved.
//

import Foundation
import RealmSwift

class Sensor:Object{
    
    // Name
    private dynamic var _name:String = ""
    
    let ledModule = LinkingObjects(fromType: LedModule.self, property: "_sensors")
}

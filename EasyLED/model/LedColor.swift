//
//  LedColor.swift
//  EasyLED
//
//  Created by imac on 28/11/2016.
//  Copyright © 2016 laurent. All rights reserved.
//

import Foundation

class LedColor:Led {
    // Color
    private dynamic var _color:String = ""
    // DWL : (Half Width Wave Lenght)
    private dynamic var _dwl:[Float] = []
    
    public func setColor(forColor color:String) {
        realm?.beginWrite()
        _color = color
        try! realm?.commitWrite()
    }
    
    public func setDWL(forDWL dwl:[Float]) {
        _dwl = dwl
    }
    
    public func getColor() -> String {
        return _color
    }
    
    public func fetdwl() -> [Float]{
        return _dwl
    }
    
}

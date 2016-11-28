//
//  LedWhite.swift
//  EasyLED
//
//  Created by imac on 28/11/2016.
//  Copyright © 2016 laurent. All rights reserved.
//

import Foundation

class LedWhite:Led {
    //CCT
    private dynamic var _cct:Int = 0
    //RA
    private dynamic var _ra:Int = 0
    
    public func setCCT(forCCT cct:Int){
        realm?.beginWrite()
        _cct = cct
        try! realm?.commitWrite()
    }
    
    public func setRA(forRA ra:Int){
        realm?.beginWrite()
        _ra = ra
        try! realm?.commitWrite()
    }
    
    public func getCCT() -> Int {
        return _cct
    }
    
    public func getRA() -> Int {
        return _ra
    }
    
}

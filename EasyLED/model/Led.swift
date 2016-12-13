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


class Led:Object,Mappable,UrlProtocol{
    private dynamic var _name:String = ""
    private dynamic var _power:Float = 0
    private dynamic var _color:String = ""
    private dynamic var _fwhm:Float = 0
    private dynamic var _cct:Int = 0
    private dynamic var _ra:Int = 0
    
    
    public func getName() -> String {
        return _name
    }
    public func getPower() -> Float {
        return _power
    }
    public func getColor() -> String {
        return _color
    }
    public func getFWHM() -> Float? {
        var fwhmVal: Float?
        if self._color != "White" {
            fwhmVal = _fwhm
        }
        return fwhmVal
    }
    public func getCCT() -> Int? {
        var cctVal: Int?
        if self._color == "White" {
            cctVal = _cct
        }
        return cctVal
    }
    public func getRa() -> Int? {
        var raVal: Int?
        if self._color == "White" {
            raVal = _ra
        }
        return raVal
    }
    
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

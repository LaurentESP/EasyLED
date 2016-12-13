//
//  SensorTemperature.swift
//  EasyLED
//
//  Created by imac on 28/11/2016.
//  Copyright © 2016 laurent. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper
//import ObjectMapper_Realm

class SensorTemperature: Object,Mappable,Meta {
    
    private static let typeOfSensor = "Temp"
    private var _temperatures = List<Temperature>()
    dynamic private  var _name:String = ""
    
    public func setTemperatures(forListOfTemperatures temp:List<Temperature>) {
        realm?.beginWrite()
        _temperatures = temp
        try! realm?.commitWrite()
    }
    
    public func addTemperature(forTemperature temp:Temperature) {
        realm?.beginWrite()
        _temperatures.append(temp)
        try! realm?.commitWrite()
    }
    
    public func getTemperatures()-> List<Temperature>{
        return _temperatures
    }
    
    public func getTemperature(atDate date:Int) -> Temperature? {
        var temperature:Temperature?
        for i in 0..<_temperatures.count {
            if _temperatures[i].getDate() == date {
                temperature = _temperatures[i]
            }
        }
        return temperature
    }
    
    public func setName(withName name:String) {
        realm?.beginWrite()
        _name = name
        try! realm?.commitWrite()
    }
    
    public func getName() -> String {
        return _name
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        _name <- map["sensorName"]
        _temperatures <- map["temperatures"]
        //_temperatures <- (map["temperatures"], ListTransform<Temperature>)
        /*if let listOfTemperatures = Mapper<Temperature>().mapArray(map["_temperatures"].currentValue){
            _temperatures.appendContentsOf(listOfTemperatures)
        }*/
    }
    
    static func url() -> String {
        return "http://localhost:3000/db"
    }
    /*
    public func setSensor(withSensor sensor:Sensor){
        realm?.beginWrite()
        _sensor = sensor
        try! realm?.commitWrite()
    }
    
    public func getSensor() -> Sensor {
        return _sensor
    }*/
    
}

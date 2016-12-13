//
//  TemperatureManager.swift
//  EasyLED
//
//  Created by LMB SAS on 13/12/2016.
//  Copyright © 2016 laurent. All rights reserved.
//

import Foundation
import RealmSwift

class TemperatureManager{
    private let _temperatureList:Results<Temperature>
    private let _realm:Realm
    
    init(withRealm realm:Realm) {
        _realm = realm
        _temperatureList = _realm.objects(Temperature.self).sorted(byProperty: "_date")
    }
    
    //Temperature Sensors Management
    func getIndexTemp(forTemp temp:Temperature) -> Int? {
        return _temperatureList.index(of: temp)
    }
    
    func getTemperatureCount() -> Int {
        return _temperatureList.count
    }
    
    func getTemperature(atIndex index:Int) -> Temperature?{
        var temp:Temperature?
        if index >= 0 && index < _temperatureList.count {
            temp = _temperatureList[index]
        }
        return temp
    }
    
    func getTemperatureList() -> Results<Temperature> {
        return _temperatureList
    }
    
    func getTemperatureList(fromDate dateVal:Int) -> Results<Temperature> {
        let predicate = NSPredicate(format: "_date >= %i",dateVal)
        return _temperatureList.filter(predicate)
    }
    
    func getTemperatureList(fromDate dateFr:Int, toDate dateTo:Int) -> Results<Temperature> {
        let predicate = NSPredicate(format: "_date >= %i AND _date <= %i ",dateFr, dateTo)
        return _temperatureList.filter(predicate)
    }
    
    
    
}

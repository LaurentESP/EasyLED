//
//  SensorTemperatureTests.swift
//  EasyLED
//
//  Created by imac on 30/11/2016.
//  Copyright © 2016 laurent. All rights reserved.
//

import XCTest
import RealmSwift
@testable import EasyLED

class SensorTemperatureTests: XCTestCase {
    
    var sensorTemp:SensorTemperature!
    var realm:Realm!
    
    override func setUp() {
        super.setUp()
        realm = try! Realm(configuration: Realm.Configuration(inMemoryIdentifier: self.name))
        XCTAssertNil(realm.objects(Temperature.self).first)
        sensorTemp = SensorTemperature()
        try! realm.write{
            realm.add(sensorTemp)
        }
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testArrayEquals(){
        let array1:[Int] = [5,4,8,3]
        let array2:[Int] = [5,4,8,3]
        XCTAssertEqual(array1, array2)
    }
    
    func testTemperaturesToSensor() {
        // Initial value
        XCTAssertEqual(sensorTemp.getTemperatures().count,0)
        XCTAssertEqual(sensorTemp.getName(),"")
        XCTAssertNil(realm.objects(Temperature.self).first?.getTempValue())
        XCTAssertNil(realm.objects(Temperature.self).first?.getDate())
        //XCTAssertNil(realm.objects(Sensor.self).first?.getName())
        
        // ADD Temperature Name and 2 temperatures
        sensorTemp.setName(withName: "ST01")
        let temperature1:Temperature = Temperature()
        temperature1.setTempVal(forValue: 70.5, forDate: 187534)
        sensorTemp.addTemperature(forTemperature: temperature1)
        let temperature2:Temperature = Temperature()
        temperature2.setTempVal(forValue: -17.8, forDate: 87935)
        sensorTemp.addTemperature(forTemperature: temperature2)
        
        //Test the name of the sensor
        XCTAssertEqual(sensorTemp.getName(), "ST01")
        // Get list of 2 temperatures
        let listTemp:List<Temperature> = List<Temperature>()
        listTemp.append(temperature1)
        listTemp.append(temperature2)
        let listTempInObject = sensorTemp.getTemperatures()
        XCTAssertNotEqual(listTempInObject.count, 0)
        XCTAssert(areTemperatureListsEquals(l1: listTempInObject, l2: listTemp))
        
        XCTAssertEqual(sensorTemp.getTemperature(atDate: 87935), temperature2)
        // Check if the database had been filled
        //TODO Test the name of the sensor in the DB
        XCTAssertEqual(realm.objects(SensorTemperature.self).first?.getName(), "ST01")
        let listTempInDB = realm.objects(SensorTemperature.self).first?.getTemperatures()
        XCTAssertNotNil(listTempInDB)
        XCTAssert(areTemperatureListsEquals(l1: listTempInDB!, l2: listTemp))
        //XCTAssertEqual(realm.objects(Temperature.self).first?.getDate(), 187534)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func areTemperatureListsEquals(l1:List<Temperature>, l2:List<Temperature>) -> Bool{
        guard l1.count == l2.count else {
            return false
        }
        
        for i in 0..<l1.count {
            if (l1[i] != l2[i]){
                return false
            }
        }
        return true
    }
    
}

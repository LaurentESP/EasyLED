//
//  LedModuleTests.swift
//  EasyLED
//
//  Created by imac on 01/12/2016.
//  Copyright © 2016 laurent. All rights reserved.
//

import XCTest
import RealmSwift
import ObjectMapper
@testable import EasyLED

class LedModuleTests: XCTestCase {
    
    var ledModule:LedModule!
    var realm:Realm!
    
    override func setUp() {
        super.setUp()
        realm = try! Realm(configuration: Realm.Configuration(inMemoryIdentifier: self.name))
        ledModule = LedModule(withRealm: realm)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSetSensorManager() {
        let sensorManager: SensorManager = SensorManager(withRealm: realm)
        let sensorT:SensorTemperature = SensorTemperature()
        let temp1:Temperature = Temperature()
        temp1.setTempVal(forValue: 70.5, forDate: 78941)
        sensorT.addTemperature(forTemperature: temp1)
        sensorManager.addSensorTemperature(withTemperatureSensor: sensorT)
        ledModule.setSensorManager(withSensorManager: sensorManager)
        //let sensorManagerFromObject = ledModule.getSensorManager()!
        XCTAssertEqual(realm.objects(Temperature.self).first?.getTempValue(), 70.5)
        
        let temp2:Temperature = Temperature()
        temp2.setTempVal(forValue: 90.5, forDate: 2472)
        sensorT.addTemperature(forTemperature: temp2)
        XCTAssertEqual(realm.objects(Temperature.self)[1].getTempValue(), 90.5)
        
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testGetSensorManager() {
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    
    
}

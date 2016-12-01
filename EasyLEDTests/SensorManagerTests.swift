//
//  SensorManagerTests.swift
//  EasyLED
//
//  Created by imac on 28/11/2016.
//  Copyright © 2016 laurent. All rights reserved.
//

import XCTest
import RealmSwift
@testable import EasyLED

class SensorManagerTests: XCTestCase {
    
    var sensorManager:SensorManager!
    var realm:Realm!
    
    override func setUp() {
        super.setUp()
        realm = try! Realm(configuration: Realm.Configuration(inMemoryIdentifier: self.name))
        sensorManager = SensorManager(withRealm: realm)
        print(realm.configuration.fileURL)
        /*try! realm.write{
            realm.add(sensorTemp)
        }*/
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testCreateSensorTemperature(){
        XCTAssertEqual(sensorManager.getSensorTemperatureCount(), 0)
        let sensor1:SensorTemperature = SensorTemperature()
        let sensor2:SensorTemperature = SensorTemperature()
        sensorManager.addSensorTemperature(withTemperatureSensor: sensor1)
        XCTAssertEqual(sensorManager.getSensorTemperatureCount(), 1)
        sensorManager.addSensorTemperature(withTemperatureSensor: sensor2)
        XCTAssertEqual(sensorManager.getSensorTemperatureCount(), 2)
        
    }
    
    func testDeleteSensorTemperature(){
        XCTAssertEqual(sensorManager.getSensorTemperatureCount(), 0)
        XCTAssertEqual(realm.objects(SensorTemperature.self).count, 0)
        let sensor1:SensorTemperature = SensorTemperature()
        let sensor2:SensorTemperature = SensorTemperature()
        sensorManager.addSensorTemperature(withTemperatureSensor: sensor1)
        sensorManager.addSensorTemperature(withTemperatureSensor: sensor2)
        sensorManager.deleteSensorTemperature(atIndex: 1)
        XCTAssertEqual(sensorManager.getSensorTemperatureCount(), 1)
        XCTAssertEqual(realm.objects(SensorTemperature.self).count, 1)
        
    }
    
    func testGetTemperatureSensor(){
        XCTAssertEqual(sensorManager.getSensorTemperatureCount(), 0)
        XCTAssertEqual(realm.objects(SensorTemperature.self).count, 0)
        XCTAssertNil(sensorManager.getSensorTemperature(atIndex: 4))
        let sensor1:SensorTemperature = SensorTemperature()
        let sensor2:SensorTemperature = SensorTemperature()
        sensor2.setName(withName: "Sensor2")
        sensorManager.addSensorTemperature(withTemperatureSensor: sensor1)
        sensorManager.addSensorTemperature(withTemperatureSensor: sensor2)
        XCTAssertEqual(sensorManager.getIndexTemp(forSensorTemp: sensor1), 0)
        let sensorFromObject = sensorManager.getSensorTemperature(atIndex: 1)
        XCTAssertEqual(sensorFromObject, sensor2)
        XCTAssertEqual(realm.objects(SensorTemperature.self).filter("_name = 'Sensor2'").count, 1)
        XCTAssertEqual(realm.objects(SensorTemperature.self).filter("_name = 'Sensor2'").first?.getName(), "Sensor2")
    }
    
}

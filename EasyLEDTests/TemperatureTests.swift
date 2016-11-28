//
//  TemperatureTests.swift
//  EasyLED
//
//  Created by imac on 28/11/2016.
//  Copyright © 2016 laurent. All rights reserved.
//

import XCTest
import RealmSwift
@testable import EasyLED

class TemperatureTests: XCTestCase {
    
    var temperature:Temperature!
    var realm:Realm!
    
    override func setUp() {
        super.setUp()
        realm = try! Realm(configuration: Realm.Configuration(inMemoryIdentifier: self.name))
        XCTAssertNil(realm.objects(Temperature.self).first)
        temperature = Temperature()
        try! realm.write{
            realm.add(temperature)
        }
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
    
    func testTemperature() {
        XCTAssertEqual(temperature.getValue(), 0)
        XCTAssertEqual(temperature.getDate(), 0)
        XCTAssertEqual(realm.objects(Temperature.self).first?.getValue(), 0)
        XCTAssertEqual(realm.objects(Temperature.self).first?.getDate(), 0)
        temperature.setValue(forVal: 70.5, forDate: 187534)
        XCTAssertEqual(temperature.getValue(), 70.5)
        XCTAssertEqual(temperature.getDate(), 187534)
        XCTAssertEqual(realm.objects(Temperature.self).first?.getValue(), 70.5)
        XCTAssertEqual(realm.objects(Temperature.self).first?.getDate(), 187534)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

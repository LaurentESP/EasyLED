//
//  LedManagerTests.swift
//  EasyLED
//
//  Created by imac on 28/11/2016.
//  Copyright © 2016 laurent. All rights reserved.
//

import XCTest
import RealmSwift
@testable import EasyLED

class LedManagerTests: XCTestCase {
    
    var led:Led!
    var realm:Realm!
    
    override func setUp() {
        super.setUp()
        realm = try! Realm(configuration: Realm.Configuration(inMemoryIdentifier: self.name))
        XCTAssertNil(realm.objects(Temperature.self).first)
        led = Led()
        try! realm.write{
            realm.add(led)
        }
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAddLed() {
        XCTAssertEqual(led.getName(), "")
        XCTAssertEqual(led.getPower(), 0)
        XCTAssertEqual(realm.objects(Led.self).first?.getName(), "")
        XCTAssertEqual(realm.objects(Led.self).first?.getPower(), 0)
        led.setName(withName: "LED01")
        led.setPower(forPow: 150)
        XCTAssertEqual(led.getName(), "LED01")
        XCTAssertEqual(led.getPower(), 150)
        XCTAssertEqual(realm.objects(Led.self).first?.getName(), "LED01")
        XCTAssertEqual(realm.objects(Led.self).first?.getPower(), 150)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

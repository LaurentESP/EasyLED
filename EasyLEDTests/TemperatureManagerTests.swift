//
//  TemperatureManagerTests.swift
//  EasyLED
//
//  Created by LMB SAS on 13/12/2016.
//  Copyright © 2016 laurent. All rights reserved.
//

import XCTest
import RealmSwift
@testable import EasyLED

class TemperatureManagerTests: XCTestCase {
    
    var realm:Realm!
    var apiMgnTest:ApiManagementTests!
    var tempManager:TemperatureManager!
    
    override func setUp() {
        super.setUp()
        realm = try! Realm(configuration: Realm.Configuration(inMemoryIdentifier: self.name))
        apiMgnTest = ApiManagementTests()
        tempManager = TemperatureManager(withRealm: realm)
        print(realm.configuration.fileURL as Any)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetTemperatureCount() {
        ApiManagement._realm = realm
        let expectation = self.expectation(description: "\(Temperature.url())")
        _ = ApiManagement.get(Temperature.self, success : {
            expectation.fulfill()
        }){ (error) in
            
        }
        
        waitForExpectations(timeout: 5) { error in
            XCTAssertNil(error, "\(error)")
        }
        XCTAssertEqual(tempManager.getTemperatureCount(),5)
    }
    
    func testGetTemperatureAtIndex() {
        ApiManagement._realm = realm
        let expectation = self.expectation(description: "\(Temperature.url())")
        _ = ApiManagement.get(Temperature.self, success : {
            expectation.fulfill()
        }){ (error) in
            
        }
        
        waitForExpectations(timeout: 5) { error in
            XCTAssertNil(error, "\(error)")
        }
        print(tempManager.getTemperatureList())
        XCTAssertEqual((tempManager.getTemperature(atIndex: 3)?.getTempValue()), 137.194)
    }
    
    func testGetTemperatureFromDate() {
        ApiManagement._realm = realm
        let expectation = self.expectation(description: "\(Temperature.url())")
        _ = ApiManagement.get(Temperature.self, success : {
            expectation.fulfill()
        }){ (error) in
            
        }
        
        waitForExpectations(timeout: 5) { error in
            XCTAssertNil(error, "\(error)")
        }
        
        let listOfTemp = tempManager.getTemperatureList(fromDate: 22532)
        print(listOfTemp)
        XCTAssertEqual(listOfTemp.count, 3)
    }
    
    func testGetTemperatureFromDateToDate() {
        ApiManagement._realm = realm
        let expectation = self.expectation(description: "\(Temperature.url())")
        _ = ApiManagement.get(Temperature.self, success : {
            expectation.fulfill()
        }){ (error) in
            
        }
        
        waitForExpectations(timeout: 5) { error in
            XCTAssertNil(error, "\(error)")
        }
        XCTAssertEqual(tempManager.getTemperatureList(fromDate: 16222,toDate: 23449).count, 3)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

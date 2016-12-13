//
//  ApiManagementTests.swift
//  EasyLED
//
//  Created by LMB SAS on 08/12/2016.
//  Copyright © 2016 laurent. All rights reserved.
//

import XCTest
import Alamofire
import RealmSwift
@testable import EasyLED

class ApiManagementTests: XCTestCase {
    
    var realm:Realm!
    
    override func setUp() {
        super.setUp()
        realm = try! Realm(configuration: Realm.Configuration(inMemoryIdentifier: self.name))
        print(realm.configuration.fileURL as Any)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testLedAPI(){
        print("LED API Tests Begin")
        ApiManagement._realm = realm
        let expectation = self.expectation(description: "\(Led.url())")
        _ = ApiManagement.get(Led.self, success : {
            expectation.fulfill()
        }){ (error) in
            
        }
        
        waitForExpectations(timeout: 5) { error in
            XCTAssertNil(error, "\(error)")
        }
        
        let dataInDB = realm.objects(Led.self)
        XCTAssertEqual(dataInDB.count,5)
        XCTAssertEqual(dataInDB.first?.getName(), "hello")
        XCTAssertEqual(dataInDB.first?.getPower(), 23689)
    }
    
    func testTemperature(){
        print("Temperature API Test Begin")
        ApiManagement._realm = realm
        let expectation = self.expectation(description: "\(Temperature.url())")
        _ = ApiManagement.get(Temperature.self, success: {
            expectation.fulfill()
        }) { (error) in
        
        }
        waitForExpectations(timeout: 5) { error in
            XCTAssertNil(error, "\(error)")
        }
        let dataInDB = realm.objects(Temperature.self)
        XCTAssertEqual(dataInDB.count,5)
        XCTAssertEqual(dataInDB.first?.getTempValue(), 112.106)
        XCTAssertEqual(dataInDB.first?.getDate(), 23689)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

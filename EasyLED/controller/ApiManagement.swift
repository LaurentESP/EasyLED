//
//  apiManagement.swift
//  EasyLED
//
//  Created by imac on 01/12/2016.
//  Copyright © 2016 laurent. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import RealmSwift

class ApiManagement {
    static var _realm:Realm!
    
    init(withRealm realm:Realm) {
        ApiManagement._realm = realm
    }
    
    static func get <T: Object> (_ type: T.Type, success:@escaping () -> Void, fail:@escaping (_ error:NSError)->Void)->Void where T:Mappable, T:UrlProtocol {
        Alamofire.request(type.url())
            .responseArray{ (response:DataResponse<[T]>) in
                switch response.result {
                case .success(let items):
                    do {
                        try ApiManagement._realm.write {
                            for item in items {
                                ApiManagement._realm.add(item)
                                //realm.add(item, update: true)
                            }
                        }
                    } catch let error as NSError {
                        fail(error)
                    }
                    success()
                case .failure(let error):
                    fail(error as NSError)
                }
        }
    }
    
    /* func updateTemperatures() {
     print("Update Temperature")
     Alamofire.request("http://localhost:3000/temperatures").responseJSON {response in
     print(response.request)  // original URL request
     print(response.response) // HTTP URL response
     print(response.data)     // server data
     print(response.result)   // result of response serialization
     
     if let JSON = response.result.value {
     print("JSON: \(JSON)")
     }
     }
     }
     
     static func testAlamofire(){
     print("Test Alamofire")
     Alamofire.request("https://httpbin.org/get").responseJSON { response in
     print(response.request!)  // original URL request
     print(response.response!) // HTTP URL response
     print(response.data!)     // server data
     print(response.result)   // result of response serialization
     
     if let JSON = response.result.value {
     print("JSON: \(JSON)")
     }
     }
     }*/
    
}

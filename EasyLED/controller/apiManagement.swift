//
//  apiManagement.swift
//  EasyLED
//
//  Created by imac on 01/12/2016.
//  Copyright © 2016 laurent. All rights reserved.
//

import Foundation
import RealmSwift
import Alamofire
import ObjectMapper

class apiManagement {
    
        /*static func get<t: object="" where="" t:= "" mappable,= "" t:= "" meta = ""> (type: T.Type, success:() -> Void, fail: (NSError) -> Void) -> Void {
            Alamofire.request(Method.GET, type.url())
                .responseArray { (response: Response<[T], NSError>) in
                    switch response.result {
                    case .Success(let items):
                        autoreleasepool {
                            do {
                                let realm = try Realm()
                                try realm.write {
                                    for item in items {
                                        realm.add(item, update: true)
                                    }
                                }
                            } catch let error as NSError {
                                fail(error)
                            }
                        }
                        success()
                    case .Failure(let error):
                        fail(error)
                    }
            }*/
    func updateTemperatures() {
        
        Alamofire.request("http://localhost:2707/submodule").responseJSON { response in
            
            }
    }
        
}

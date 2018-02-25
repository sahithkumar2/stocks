//
//  ModelHelper.swift
//  FootLockerAssignment
//
//  Created by Dileep on 2/25/18.
//  Copyright © 2018 Dileep. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ModelHelper {
    
    class func makeGetRequestWithURL(_ urlToRequest:URL,
                                     completion: @escaping (_ result: Bool, _ data:JSON, _ eror_message:String) -> ()) {
        var success:Bool = false
        var jsonObj:JSON = ""
        var error_message:String = ""
        
        Alamofire.request( urlToRequest , method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
            .responseJSON { (dataResponse) -> Void in
                
                if dataResponse.result.error == nil  {
                    let statusCode = dataResponse.response?.statusCode
                    if (statusCode == 200) {
                        success = true
                        jsonObj = JSON(dataResponse.result.value!)
                    }
                    else {
                        error_message = jsonParseErr
                    }
                    
                } else {
                    error_message = "\((dataResponse.result.error?.localizedDescription)!)"
                    
                }
                completion(success, jsonObj , error_message)
        }
        
    }
    
    class func createModelObject(recievedDataArray : [NSDictionary]) -> [StocksModel]  {
        var stockModelArray = [StocksModel]()
        for item in recievedDataArray {
            let tObjectLocal = StocksModel(stockDict: item as! [String : Any])
            stockModelArray.append(tObjectLocal)
        }
        return stockModelArray
    }
    
    
    
}

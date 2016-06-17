//
//  UserApi.swift
//  Fintalk1
//
//  Created by Erik Andersen on 6/14/16.
//  Copyright © 2016 The Andersen Family Press. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class UserApi {
    
    func login(username: String, password: String, completionBlock:(error: NSError?, response: AnyObject?) -> Void) {
        
        let url = "https://fl18gsgg39.execute-api.us-east-1.amazonaws.com/dev/Auth"
        let params = [
            "username" : username,
            "password" : password
        ]

        
        Alamofire.request(.POST, url, parameters: params, encoding: .JSON)
            .validate()
            .responseJSON { (response: Response<AnyObject, NSError>) in
            
                if let error = response.result.error {
                    return completionBlock(error: error, response: nil)
                }
                else if let result = response.result.value {
                    return completionBlock(error: nil, response: result)
                }
                else {
                    return completionBlock(error: nil, response: nil)
                }
        }
    }
}
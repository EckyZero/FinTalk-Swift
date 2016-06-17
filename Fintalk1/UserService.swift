//
//  UserService.swift
//  Fintalk1
//
//  Created by Erik Andersen on 6/14/16.
//  Copyright © 2016 The Andersen Family Press. All rights reserved.
//

import Foundation
import MagicalRecord

class UserService {
    
    func login(username: String, password: String, completionBlock: (error: String?, user: User?) -> Void) {
        
        let userApi = UserApi()
        
        userApi.login(username, password: password) { (error, response) in
            
            if error != nil {
                return completionBlock(error: "An Unknown Error Occurred", user: nil)
            }
            else if response == nil {
                return completionBlock(error: "No results found", user: nil)
            }
            else {
                
                if let json = response as? [String: AnyObject] {
                    
                    if let userJson = json["user"] {
                        
                        User.MR_truncateAll()
                        let user = User.MR_importFromObject(userJson)
                        
                        NSManagedObjectContext.MR_defaultContext().MR_saveToPersistentStoreAndWait()
                        
                        return completionBlock(error: nil, user: user)
                    }
                    else {
                        return completionBlock(error: "No user data found", user: nil)
                    }
                }
                else {
                    return completionBlock(error: "Error parsing results", user: nil)
                }
            }
        }
    }
}
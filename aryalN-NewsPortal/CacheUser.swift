//
//  CacheUser.swift
//  aryalN-NewsPortal
//
//  Created by dev9 on 11/29/16.
//  Copyright © 2016 ebpearls. All rights reserved.
//

import Foundation

class CacheUserData: NSObject , NSCoding {
    
    //MARK: - Variables
    
    var username = String()
    
    //MARK: - Initializer function for class
    
    init(username:String){
        
        self.username = username
        
    }
    
    //MARK: - NSCoding Methods
    
    required convenience init?(coder decoder:NSCoder){
        guard let username = decoder.decodeObject(forKey: DefaultKeys.username.rawValue) as? String
            else{
                return nil
        }
        
        self.init(username:username)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.username,forKey:DefaultKeys.username.rawValue)
    }
    
    
    func save() {
        sharedUserManager.save(user: self)
    }
}


/*
 ,let email = decoder.decodeObject(forKey: DefaultKeys.email.rawValue) as? String
 ,let password = decoder.decodeObject(forKey: DefaultKeys.password.rawValue) as? String
*/

/*
 aCoder.encode(self.email,forKey:DefaultKeys.email.rawValue)
 aCoder.encode(self.password,forKey:DefaultKeys.password.rawValue)
*/

/*
 ,email:String,password:String
 self.email = email
 self.password = password
 */

/*
 
 var password = String()
 var email = String()
 
 */

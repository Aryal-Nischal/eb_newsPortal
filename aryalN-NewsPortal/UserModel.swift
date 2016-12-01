//
//  UserModel.swift
//  aryalN-NewsPortal
//
//  Created by dev9 on 12/1/16.
//  Copyright © 2016 ebpearls. All rights reserved.
//

import Foundation

class UserModel: NSObject , NSCoding {
    
    //MARK: - Variables
    
    var username = String()
    var userAccessCode = String()
    var email = String()
    
    //MARK: - Initializer function for class
    
    init(username:String = "", email:String = "",userAccessCode:String = ""){
        
        self.username = username
        self.email = email
        self.userAccessCode = userAccessCode
    }
    
    //MARK: - NSCoding Methods
    
    required convenience init?(coder decoder:NSCoder){
        guard let username = decoder.decodeObject(forKey: DefaultKeys.username.rawValue) as? String,
            let email = decoder.decodeObject(forKey: DefaultKeys.userEmail.rawValue) as? String,
            let userAccessCode = decoder.decodeObject(forKey: DefaultKeys.userAccessCode.rawValue) as? String

            else{
                return nil
        }
        
        self.init(username:username, email: email, userAccessCode:userAccessCode)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.username,forKey:DefaultKeys.username.rawValue)
        aCoder.encode(self.email,forKey:DefaultKeys.userEmail.rawValue)
        aCoder.encode(self.userAccessCode,forKey:DefaultKeys.userAccessCode.rawValue)

    }
    
    func save() {
        sharedUserManager.save(user: self)
    }
    
    func load()->UserModel{
        return sharedUserManager.load()
    }
}






































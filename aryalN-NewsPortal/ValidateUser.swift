//
//  ValidateUser.swift
//  aryalN-NewsPortal
//
//  Created by dev9 on 11/29/16.
//  Copyright © 2016 ebpearls. All rights reserved.
//

import Foundation

typealias successClosureHandler = (_ success: Bool,_ error:String)->()

class ValidateUser{
    
    //MARK: - Variables
    var username = String()
    var password = String()
    
    //MARK: - Initializer
    init(username:String, password:String){
        self.username = username
        self.password = password
    }
    
    //MARK: - Validate Methods
    
    func isUsernameValid() -> Bool{
        
        let validEmail = NSPredicate(format:"SELF MATCHES %@", RegexConst.Email.rawValue)
        
        return validEmail.evaluate(with: self.username)
    }
    
    func isPasswordValid() -> Bool{
        
        let validPassword = NSPredicate(format:"SELF MATCHES %@", RegexConst.Password.rawValue as String)
        return validPassword.evaluate(with: self.password)
    }
    
    func areAllFieldsValid(dataValidity:successClosureHandler){
        var success = true
        var errorMessage = "Congrats"
        
        if (!isUsernameValid()){
            errorMessage = "Invalid Username. Enter valid email"
            success = false
        }
        else if (!isPasswordValid()){
            errorMessage = "Invalid Password length. Password must be minimum 6 characters in length"
            success = false
        }
        
        dataValidity(success,errorMessage)
            
        }
}


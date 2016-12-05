//
//  RegisterValidation.swift
//  aryalN-NewsPortal
//
//  Created by dev9 on 12/2/16.
//  Copyright © 2016 ebpearls. All rights reserved.
//

import Foundation


class RegisterValidation:Validable{
    
    var user:RegisterModel?
    
    init(user:RegisterModel?){
        self.user = user
    }

    //MARK: - Validate Methods
    
    func isUsernameValid() -> Bool{
        
        let validUsername = NSPredicate(format:"SELF MATCHES %@", RegexConst.Password.rawValue as String)
        return validUsername.evaluate(with: user?.username)
    }
    
    func isEmailValid() -> Bool{
        
        let validEmail = NSPredicate(format:"SELF MATCHES %@", RegexConst.Password.rawValue as String)
        return validEmail.evaluate(with: user?.email)
    }
    
    func isPasswordValid() -> Bool{
        
        let validPassword = NSPredicate(format:"SELF MATCHES %@", RegexConst.Password.rawValue as String)
        return validPassword.evaluate(with: user?.password)
    }
    
    func areAllFieldsValid(dataValidity:successClosureHandler){
        var success = true
        var errorMessage = ""
        
        if (!isUsernameValid()){
            errorMessage = "Invalid Username. Must be atleast 6 characters"
            success = false
        }
        else if (!isEmailValid()){
            errorMessage = "Invalid Email.Enter valid email"
            success = false
        }
        else if (!isPasswordValid()){
            errorMessage = "Invalid Password length. Password must be minimum 6 characters in length"
            success = false
        }
        else if(user?.confirmPassword != user?.password){
            errorMessage = "Password doesnt match"
            success = false
        }
        
        dataValidity(success,errorMessage)
        
    }

    
    
}

//
//  UserValidation.swift
//  aryalN-NewsPortal
//
//  Created by dev9 on 12/1/16.
//  Copyright © 2016 ebpearls. All rights reserved.
//

import Foundation

typealias successClosureHandler = (_ success: Bool,_ error:String)->()



class UserValidation: Validable {
    
    //MARK: - Variables
    var user: UserModel?
    
    
    //MARK: - Initializer
    init(user:UserModel){
        self.user = user
    }

    
    //MARK: - Validate Methods
    func isUsernameValid() -> Bool{
        let validEmail = NSPredicate(format:"SELF MATCHES %@", RegexConst.Email.rawValue)
        return validEmail.evaluate(with: user!.email)
    }
    
    
    func isPasswordValid() -> Bool{
        let validPassword = NSPredicate(format:"SELF MATCHES %@", RegexConst.Password.rawValue as String)
        return validPassword.evaluate(with: user!.password)
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


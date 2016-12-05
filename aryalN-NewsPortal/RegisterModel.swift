//
//  RegisterModel.swift
//  aryalN-NewsPortal
//
//  Created by dev9 on 12/2/16.
//  Copyright © 2016 ebpearls. All rights reserved.
//

import Foundation

class RegisterModel{
    var username:String?
    var email:String?
    var password:String?
    var confirmPassword:String?
    
    init(username:String?,password:String?,confirmPassword:String?,email:String?){
        
        self.username = username
        self.password = password
        self.confirmPassword = confirmPassword
        self.email = email
    }
    
    func validate(sendResult:(_ success:Bool,_ error:String?)->()){
        let validationObject = RegisterValidation(user:self)
        validationObject.areAllFieldsValid { (boolResult, error) in
            sendResult(boolResult,error)
        }
    }
    
    func callServerForRegistration(registerResult:@escaping RegistrationResult){
        sharedRegisterManager.Register(user: self, dataCarryingClosure: registerResult)
    }

}

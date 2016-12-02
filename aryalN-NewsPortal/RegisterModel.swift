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
        validationObject.areAllFieldsValid { (result, error) in
            sendResult(result,error)
        }
    }
    
    func callServerForRegistration(registerResult:@escaping (_ result:Any?,_ error:String?)->()){
        sharedRegisterManager.Register(user:self) { (result, error) in
            registerResult(result,error)
        }
    }

}

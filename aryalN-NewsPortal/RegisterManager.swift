//
//  RegisterManager.swift
//  aryalN-NewsPortal
//
//  Created by dev9 on 12/2/16.
//  Copyright © 2016 ebpearls. All rights reserved.
//

import Foundation
import Alamofire

typealias RegistrationResult = (_ data:Any? ,_ error:String?)->()

let sharedRegisterManager = RegisterManager.instance

class RegisterManager{
    static let instance = RegisterManager()
    
    //validated data have arrived. make them parameter and call server for registration
    
    func Register(user:RegisterModel,dataCarryingClosure:@escaping RegistrationResult){
        let url = FullDomainName.fullname(.register).description
        
        let sendParameter = ["username":user.username! as String,"useremail":user.email! as String,"password":user.password! as String]
        //ERROR BECAUSE NO PARAMETER PROVIDED
        Alamofire.request(url, method: .post, parameters: sendParameter, encoding: URLEncoding.default, headers: ["X-API-KEY":"testKey"]).responseJSON {[weak self] response in
            
            if let _ = self{
                switch response.result {
                case .success(let data):
                    dataCarryingClosure(data,nil)
                case .failure(let error):
                    dataCarryingClosure(nil,error.localizedDescription)
                }
            }
        }
    }
    
}

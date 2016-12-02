//
//  RegisterManager.swift
//  aryalN-NewsPortal
//
//  Created by dev9 on 12/2/16.
//  Copyright © 2016 ebpearls. All rights reserved.
//

import Foundation

typealias RegistrationResult = (_ data:Any? ,_ error:String?)->()

let sharedRegisterManager = RegisterManager.instance

class RegisterManager{
    static let instance = RegisterManager()
    
    //validated data have arrived. make them parameter and call server for registration
    
    func Register(user:RegisterModel,dataCarryingClosure:@escaping RegistrationResult){
        let url = FullDomainName.fullname(.login).description    //Your url
        print(url)
        
        //        ERROR BECAUSE NO PARAMETER PROVIDED
        //        Alamofire.request(url, method: .post, parameters: nil, encoding: URLEncoding.default, headers: nil){
        //        response in
        //            if(response.result == .success){
        //                //data has arrived. save them to cache to avoid future server call until logout takes place
        //                dataCarryingClosure(data,nil)
        //            }
        //            else{
        //                //send error to be displayed
        //                dataCarryingClosure(nil,error)
        //            }
        //        }
    }
    
}

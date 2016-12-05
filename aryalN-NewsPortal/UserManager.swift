//
//  UserManager.swift
//  aryalN-NewsPortal
//
//  Created by dev9 on 12/1/16.
//  Copyright © 2016 ebpearls. All rights reserved.
//

import Foundation
import Alamofire

// for to and fro data transfer
typealias loginCarryingClosure = (_ data:Any? ,_ error:String?)->()

// for single instance access
let sharedUserManager = UserManager.instance

class UserManager{
    static let instance = UserManager()
    

    
    func save(user: UserModel) {
        let currentUser = NSKeyedArchiver.archivedData(withRootObject: user)
        UserDefaults.standard.set(currentUser, forKey: DefaultKeys.appuser.rawValue)
    }
    
    func load()->UserModel?{
        var user:UserModel?
        if let accessUserDefaultsData = UserDefaults.standard.object(forKey: DefaultKeys.appuser.rawValue) as? Data{
            user = NSKeyedUnarchiver.unarchiveObject(with: accessUserDefaultsData as Data) as? UserModel
        }
        
        return user
    }
    
    //validated email and password have arrived. make them parameter and call server
    func Login(user:UserModel ,dataCarryingClosure:@escaping loginCarryingClosure){
        let url = FullDomainName.fullname(.login).description    //Your url
        let sendParameter = ["useremail":user.email! as String ,"password":user.password! as String]
        Alamofire.request(url, method: .post, parameters: sendParameter, encoding: URLEncoding.default, headers: ["X-API-KEY":"testKey"]).responseJSON {[weak self] response in
            
            if let _ = self{
                print(response.request)  // original URL request
                print(response.response) // HTTP URL response
                print(response.data)     // server data
                print(response.result)   // resul
                print(response.result.value)
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

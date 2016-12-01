//
//  UserManager.swift
//  aryalN-NewsPortal
//
//  Created by dev9 on 12/1/16.
//  Copyright © 2016 ebpearls. All rights reserved.
//

import Foundation
import Alamofire

typealias dataCarryingClosure = (_ data:Any? ,_ error:String?)->()

let sharedUserManager = UserManager.instance

class UserManager{
    static let instance = UserManager()
    
    
    func save(user: UserModel) {
        let currentUser = NSKeyedArchiver.archivedData(withRootObject: user)
        UserDefaults.standard.set(currentUser, forKey: DefaultKeys.appuser.rawValue)
    }
    
    func load()->UserModel{
        var user:UserModel?
        if let accessUserDefaultsData = UserDefaults.standard.object(forKey: DefaultKeys.appuser.rawValue) as? Data{
            user = NSKeyedUnarchiver.unarchiveObject(with: accessUserDefaultsData as Data) as! UserModel?
        }
        return user!
    }
    
    //validated email and password have arrived. make them parameter and call server
    func Login(validUsername:String,validPassword:String,dataCarryingClosure:@escaping dataCarryingClosure){
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

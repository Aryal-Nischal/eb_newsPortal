//
//  Helper.swift
//  aryalN-NewsPortal
//
//  Created by dev9 on 11/29/16.
//  Copyright © 2016 ebpearls. All rights reserved.
//

import Foundation

//creating a private instance of helper class
private let singleInstance = Helper()

typealias retrieveDataClosure = (_ dataObject:Any?)->()

class Helper{

//MARK: - Single Class Instance
    
    //variable that provides single instance of helper class
    class var instance:Helper{
        return singleInstance
    }
    
    func getUserDefaults(key:DefaultKeys , retrieveUser:retrieveDataClosure){
        let currentUserDataObject:CacheUserData?
       
        if let retrieveDataFromDefaults = UserDefaults.standard.object(forKey: key.rawValue) as? NSData{
            currentUserDataObject = NSKeyedUnarchiver.unarchiveObject(with: retrieveDataFromDefaults as Data) as! CacheUserData?
        }
        else{
            currentUserDataObject = nil
        }
        retrieveUser(currentUserDataObject)
    }
    
}

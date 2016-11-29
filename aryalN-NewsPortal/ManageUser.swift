//
//  ManageUser.swift
//  aryalN-NewsPortal
//
//  Created by dev9 on 11/29/16.
//  Copyright © 2016 ebpearls. All rights reserved.
//

import Foundation
import Alamofire

class ManageUser{
    
    // loginUrl should be provided
    //loginProcess??
    
    func Login(){
        let url = URL(string:"http://192.168.0.180/ci/BookRest/test")     //Your url
        Alamofire.request(url!).responseJSON { response in
            
            print(response.result.value)
            
            let data = response.result.value
            
            if let x = data as? [[String:Any]]{
                print("test ing \(x[0]["username"])")
                print(x[0]["password"])
            }
            else{print("error")}
        }
    }
    
}

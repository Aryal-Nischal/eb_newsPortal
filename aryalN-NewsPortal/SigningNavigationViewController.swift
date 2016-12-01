//
//  SigningNavigationViewController.swift
//  aryalN-NewsPortal
//
//  Created by dev9 on 11/23/16.
//  Copyright © 2016 ebpearls. All rights reserved.
//

import UIKit

class SigningNavigationViewController: UINavigationController {
    
//MARK: - Lifecycle function
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.selectViewController()
    }

//MARK: - View Selecting Method
    
    //Setting appropriate view controller to the Navigation container at runtime
    func selectViewController(){
        
//        let helperHandle = Helper.instance
//        
//        helperHandle.getUserDefaults(key: .appuser) {(currentUser) in
//            if(currentUser != nil){
//                self.setViewControllers([(storyboard?.instantiateViewController(withIdentifier: ControllerIdentity.HomeController.rawValue))!], animated: true)
//            }
//            else{
                self.setViewControllers([(storyboard?.instantiateViewController(withIdentifier: ControllerIdentity.SignInController.rawValue))!], animated: true)
//            }
//        }
    }

}

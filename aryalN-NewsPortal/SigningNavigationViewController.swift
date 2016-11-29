//
//  SigningNavigationViewController.swift
//  aryalN-NewsPortal
//
//  Created by dev9 on 11/23/16.
//  Copyright © 2016 ebpearls. All rights reserved.
//

import UIKit

class SigningNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.selectViewController()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func selectViewController(){
        
        let userExistance = UserDefaults.standard.object(forKey: DefaultKeys.appuser.rawValue) as? NSData
        
        if((userExistance) != nil){
            self.setViewControllers([(storyboard?.instantiateViewController(withIdentifier: ControllerIdentity.HomeController.rawValue))!], animated: true)

        }
        else{
            self.setViewControllers([(storyboard?.instantiateViewController(withIdentifier: ControllerIdentity.SignInController.rawValue))!], animated: true)

        }
    }

}

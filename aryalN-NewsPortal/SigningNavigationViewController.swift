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
        
        self.setViewControllers([(storyboard?.instantiateViewController(withIdentifier: "SignInController"))!], animated: true)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

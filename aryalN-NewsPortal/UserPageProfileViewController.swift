//
//  UserPageProfileViewController.swift
//  aryalN-NewsPortal
//
//  Created by dev9 on 11/25/16.
//  Copyright © 2016 ebpearls. All rights reserved.
//

import UIKit

class UserPageProfileViewController: UIViewController {

//MARK: - View Lifecycle Function
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customNavBarCreation(controllerHandle: self)
        revealRearView(controllerHandle: self)
        
    }

//MARK: - View Customization Methods
    
    //For making navigation bar transparent
    func customNavBarCreation(controllerHandle:UIViewController){
        controllerHandle.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        controllerHandle.navigationController?.navigationBar.shadowImage = UIImage()
        controllerHandle.navigationController?.navigationBar.isTranslucent = true
        controllerHandle.navigationController?.view.backgroundColor = UIColor.clear
        controllerHandle.navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    //For revealing rearview with gesture
    func revealRearView(controllerHandle:UIViewController){
        controllerHandle.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        controllerHandle.revealViewController().rearViewRevealWidth = self.view.bounds.size.width
        controllerHandle.revealViewController().rearViewRevealOverdraw = CGFloat(0.0)
    }

}

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
        customNavBarCreation()
        revealRearView()
        
    }

    //MARK: - Custom Button Method
    
    //For toggling the navigation bar on/off
    @IBAction func navbarButton(_ sender: AnyObject) {
        self.revealViewController().revealToggle(animated: true)
    }
    
    //MARK: - View Customization Methods
    
    //For making navigation bar transparent
    func customNavBarCreation(){
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white, NSFontAttributeName:UIFont(name:"Exo-Medium",size:18)!]
    }
    
    //For revealing rearview with gesture
    func revealRearView(){
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.revealViewController().rearViewRevealWidth = self.view.bounds.size.width
        self.revealViewController().rearViewRevealOverdraw = CGFloat(0.0)
    }

}

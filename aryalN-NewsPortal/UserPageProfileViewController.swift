//
//  UserPageProfileViewController.swift
//  aryalN-NewsPortal
//
//  Created by dev9 on 11/25/16.
//  Copyright © 2016 ebpearls. All rights reserved.
//

import UIKit

class UserPageProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.revealViewController().rearViewRevealWidth = self.view.bounds.size.width
        self.revealViewController().rearViewRevealOverdraw = CGFloat(0.0)
        //        self.navigationController?.isNavigationBarHidden = false
        //        self.navigationController?.navigationBar.isTranslucent = true
        //        self.navigationController?.navigationBar.backgroundColor = UIColor.clear
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        self.navigationController?.navigationBar.tintColor = UIColor.white

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

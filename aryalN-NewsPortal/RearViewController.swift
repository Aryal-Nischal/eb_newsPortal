//
//  RearViewController.swift
//  aryalN-NewsPortal
//
//  Created by dev9 on 11/25/16.
//  Copyright © 2016 ebpearls. All rights reserved.
//

import UIKit
import SWRevealViewController

class RearViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var rearViewTableView: UITableView!
    let tableItem = ["Home","Profile","Favourite","Settings","Logout"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rearViewTableView.delegate = self
        rearViewTableView.dataSource = self

        
        // Do any additional setup after loading the view.
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tableItem.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "navbarTableItem", for: indexPath)
        
        cell.textLabel?.text = tableItem[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell:UITableViewCell = tableView.cellForRow(at: indexPath)!
        selectedCell.contentView.backgroundColor = UIColor.red.withAlphaComponent(0.5)
        selectedCell.textLabel?.textColor = UIColor.white
        var controllerTo=""
        switch(indexPath.row){
        case 0:
            controllerTo = "HomeController"
            break
        case 1:
            controllerTo = "UserProfileController"
            break
        case 2:
            controllerTo = "FavouriteController"
            break
        case 3:
            //create settings page
            controllerTo = "SignInController"
            break
        case 4:
            //logout pop
            controllerTo = "SignUpController"
            break
        default:
            //error pop
            controllerTo = "HomeController"
            
        }
        let controller = UIApplication.shared.keyWindow?.rootViewController
        if let revealControlHandle = controller as? SWRevealViewController{
            if let navigationControlHandle = revealControlHandle.frontViewController as? UINavigationController{
                navigationControlHandle.setViewControllers([(storyboard?.instantiateViewController(withIdentifier: controllerTo))!], animated: true)
                navigationControlHandle.revealViewController().revealToggle(animated: true)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let deselectedCell = tableView.cellForRow(at: indexPath)!
        
        deselectedCell.textLabel?.textColor = UIColor.lightGray
    }
    
   
}

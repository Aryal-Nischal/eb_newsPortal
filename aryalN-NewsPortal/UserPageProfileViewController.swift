//
//  UserPageProfileViewController.swift
//  aryalN-NewsPortal
//
//  Created by dev9 on 11/25/16.
//  Copyright © 2016 ebpearls. All rights reserved.
//

import UIKit

class UserPageProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,UITextFieldDelegate {

//MARK: - Array for label and placeholder name
    let nameArrayForLabels = ["Name","E-mail","Password","ConfirmPassword"]
    var nameArrayForText = [String]()
    var isInteractionEnabled = false
    var totalItemsInTable:Int = 0
    
//MARK: - Outlets
    
    @IBOutlet weak var profileTableView: UITableView!
    @IBOutlet weak var profileEditingButton: UIBarButtonItem!
    @IBOutlet weak var doneEditingButton: UIBarButtonItem!
    
    
//MARK: - View Lifecycle Function
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileTableView.dataSource = self
        profileTableView.delegate = self
        doneEditingButton.isEnabled = false
        doneEditingButton.tintColor = UIColor.clear
        totalItemsInTable = nameArrayForLabels.count - 1
        revealRearView()
        
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.navigationController?.isNavigationBarHidden = false
        customNavBarCreation()
        
    }
    
//MARK: - For table view delegate and datasource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return totalItemsInTable
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "profileTableCell") as? ProfileTableViewCell
        
        cell?.profileCellLabel.text = nameArrayForLabels[indexPath.row]
        //cell?.profileCellTextField.text = nameArrayForText[indexPath.row]
        
        if (isInteractionEnabled == true){
            cell?.profileCellTextField.isUserInteractionEnabled = true
            //cell?.handleTextField(text: "a")
            
        }
        else{
            cell?.profileCellTextField.isUserInteractionEnabled = false
            //cell?.handleTextField(text: "B")
        }
        
        return cell!
    }
    
//MARK: - Navbar Action Methods
    
    @IBAction func editProfileButtonPressed(_ sender: AnyObject) {
        layoutViewForTextfieldEditing(1)
        profileTableView.reloadData()
    }
    
    //if problem arises check linking
    @IBAction func doneEditingButtonPressed(_ sender: AnyObject) {
        layoutViewForTextfieldEditing(2)
        profileTableView.reloadData()
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
    
//MARK: - View During TextField Edit 
    func layoutViewForTextfieldEditing(_ id:Int){
        if(id == 1){
            isInteractionEnabled = true
            totalItemsInTable = totalItemsInTable + 1
            doneEditingButton.isEnabled = true
            doneEditingButton.tintColor = UIColor.white
            profileEditingButton.isEnabled = false
            profileTableView.tintColor = UIColor.clear
            
        }
        else{
            isInteractionEnabled = false
            totalItemsInTable = totalItemsInTable - 1
            doneEditingButton.isEnabled = false
            doneEditingButton.tintColor = UIColor.clear
            profileEditingButton.isEnabled = true
            profileEditingButton.tintColor = UIColor.white
        }
    }

}

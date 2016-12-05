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
    let nameArrayForText = ["username","email","password","confirmPassword"]
    var isInteractionEnabled = false
    
    @IBOutlet weak var profileTableView: UITableView!
    @IBOutlet weak var profileEditingButton: UIBarButtonItem!
//MARK: - View Lifecycle Function
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileTableView.dataSource = self
        profileTableView.delegate = self
        
        revealRearView()
        
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.navigationController?.isNavigationBarHidden = false
        customNavBarCreation()
        
    }
    
//MARK: - For table view delegate and datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArrayForLabels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "profileTableCell") as? ProfileTableViewCell
        
        cell?.profileCellLabel.text = nameArrayForLabels[indexPath.row]
        cell?.profileCellTextField.text = nameArrayForText[indexPath.row]
        if (isInteractionEnabled == true){
            cell?.profileCellTextField.isUserInteractionEnabled = true
        }
        
        return cell!
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        //test
    }
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        //test
    }

    @IBAction func editProfileButtonPressed(_ sender: AnyObject) {
        isInteractionEnabled = true
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
    
//MARK: - Disabling and Enabling the textfield
    func disableTextfield(){
    }

}

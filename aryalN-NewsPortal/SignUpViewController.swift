//
//  SignUpViewController.swift
//  aryalN-NewsPortal
//
//  Created by dev9 on 11/23/16.
//  Copyright © 2016 ebpearls. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
//MARK: - Outlets

    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextfield: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    
    
//MARK: - ViewController Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.editingView()
    }

//MARK: - Button Methods
    
    @IBAction func signInButtonPressed(_ sender: AnyObject) {
        if let toBePopedNavigation = self.navigationController{
        toBePopedNavigation.popViewController(animated: true)
        }
    }
    
    @IBAction func signupButtonPressed(_ sender: AnyObject) {
        let checkRegistration = RegisterModel(username: usernameTextfield.text!, password: passwordTextField.text!, confirmPassword: confirmPasswordTextfield.text!, email: emailTextField.text!)
        //print("from signupbuttonpressed = \(checkRegistration.username)")
        checkRegistration.validate {[weak self] (result, error) in
            if let wself = self {
                if(error != ""){
                    //error occured
                    wself.alertDisplay(title: "Validation Error", description: error!)
                }
                else{
                    wself.startCallingServer(user:checkRegistration)
                }
            }
        }
    }
    
//MARK: - Server Calling Method
    
    func startCallingServer(user:RegisterModel){
        user.callServerForRegistration { [weak self](result, error) in
            if let weakSelf = self{
                if(error != nil){
                    //error occured
                    weakSelf.alertDisplay(title: "Server Error", description: error!)
                }
                else{
                    //registration success. proceed to login screen
                    weakSelf.alertDisplay(title: "Validation Error", description: "Success")
                }
            }
        }
    }
  
//MARK: - AlertDisplay
    
    func alertDisplay(title:String, description:String){
        let alertHandle = UIAlertController(title: title, message: description, preferredStyle: UIAlertControllerStyle.alert)
        let alertActionHandle = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        alertHandle.addAction(alertActionHandle)
        self.present(alertHandle,animated:true)
    }

    
//MARK: - View Editing Methods
    
    func editingView(){
        customNavBarCreation()
        signupButton.layer.cornerRadius = signupButton.bounds.size.height / 2.0
        editTextField(usernameTextfield)
        editTextField(emailTextField)
        editTextField(passwordTextField)
        editTextField(confirmPasswordTextfield)
    }
    
    //For making navigation bar transparent
    func customNavBarCreation(){
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white, NSFontAttributeName:UIFont(name:"Exo-Medium",size:18)!]
    }
    
    func editTextField(_ textfield:UITextField!){
        //Changing placeholder color
        textfield.attributedPlaceholder = NSAttributedString(string: textfield.placeholder != nil ? textfield.placeholder! : "", attributes: [NSForegroundColorAttributeName:UIColor.gray])
        
        //Adding the bottom underline layer to the textfield
        let bottomline = CALayer()
        bottomline.frame = CGRect(x: 0,
                                  y: textfield.frame.size.height,
                                  width: textfield.frame.size.width,
                                  height: 1.0)
        bottomline.backgroundColor = UIColor.gray.cgColor
        
        textfield.borderStyle = UITextBorderStyle.none
        textfield.layer.addSublayer(bottomline)
    }
    
    
}

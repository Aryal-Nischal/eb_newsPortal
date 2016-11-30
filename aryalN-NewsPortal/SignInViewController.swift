//
//  SignInViewController.swift
//  aryalN-NewsPortal
//
//  Created by dev9 on 11/23/16.
//  Copyright © 2016 ebpearls. All rights reserved.
//

import UIKit
import SWRevealViewController
class SignInViewController: UIViewController {

//MARK: - Outlets
    
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
//MARK: - Lifecycle Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        navigationController?.isNavigationBarHidden = true
        self.customizeView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationController?.isNavigationBarHidden = false
    }

//MARK: - Button Methods
    
    @IBAction func signinButtonPressed(_ sender: AnyObject) {
       
        let object = ValidateUser(username: usernameTextfield.text!,password: passwordTextfield.text!)
        let userObject = CacheUserData(username: usernameTextfield.text!)
        
        object.areAllFieldsValid {[weak self] (success, error) in
            if let weakSelf = self{
                if(success){
                   let currentUser = NSKeyedArchiver.archivedData(withRootObject: userObject)
                    UserDefaults.standard.set(currentUser, forKey: DefaultKeys.appuser.rawValue)
                    weakSelf.gotoHomeScreen(controllerName: .HomeController)
                }
                else{print(error)}
            }
        }
    }
    
    @IBAction func signupButtonPressed(_ sender: AnyObject) {
        self.view.endEditing(true)
    }
    
//MARK: - Goto home screen
    
    func gotoHomeScreen(controllerName:ControllerIdentity){
        let controller = UIApplication.shared.keyWindow?.rootViewController
        if let revealControlHandle = controller as? SWRevealViewController{
            if let navigationControlHandle = revealControlHandle.frontViewController as? UINavigationController{
                navigationControlHandle.setViewControllers([(storyboard?.instantiateViewController(withIdentifier: controllerName.rawValue))!], animated: true)
                
            }
        }
    }
    
//MARK: - View Customization Methods
    
    //Editing buttons and textfields
    func customizeView(){
        signInButton.layer.cornerRadius = signInButton.bounds.size.height / 2.0
        editTextField(usernameTextfield)
        editTextField(passwordTextfield)
    }
    
    //For adding design to text field
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

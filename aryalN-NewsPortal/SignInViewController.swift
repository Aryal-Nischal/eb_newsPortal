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
        
        revealRearView(controllerHandle: self)
        customNavBarCreation(controllerHandle: self)

    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        signInButton.layer.cornerRadius = signInButton.bounds.size.height / 2.0
        
        editTextField(usernameTextfield)
        editTextField(passwordTextfield)

    }

    
//MARK: - Button Methods
    
    @IBAction func signinButtonPressed(_ sender: AnyObject) {
       // self.navigationController?.pushViewController(SignUpViewController, animated: true)
        let object = ValidateUser(username: usernameTextfield.text!,password: passwordTextfield.text!)
        object.areAllFieldsValid {[weak self] (success, error) in
            if let weakSelf = self{
                if(success){
                    let x = CacheUserData(username: weakSelf.usernameTextfield.text!)
                    UserDefaults.standard.setValue(x, forKey: DefaultKeys.appuser.rawValue)
                    weakSelf.gotoHomeScreen()
                }
                else{print(error)}
            }
        }
    }
    
    @IBAction func signupButtonPressed(_ sender: AnyObject) {
        self.view.endEditing(true)
    }
    
//MARK: - Goto home screen
    
    func gotoHomeScreen(){
        let controller = UIApplication.shared.keyWindow?.rootViewController
        if let revealControlHandle = controller as? SWRevealViewController{
            if let navigationControlHandle = revealControlHandle.frontViewController as? UINavigationController{
                navigationControlHandle.setViewControllers([(storyboard?.instantiateViewController(withIdentifier: ControllerIdentity.HomeController.rawValue))!], animated: true)
                
            }
        }
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

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

        let userModelObject = UserModel(email: usernameTextfield.text!, password: passwordTextfield.text!)
        userModelObject.validate {[weak self] (result, error) in
            if let weakSelf = self{
                
                if(result == true){
                    //Success validating go to server for data
                    weakSelf.callServerForData(user:userModelObject)
                }
                else{
                    //give user reason for failure
                    weakSelf.alertDisplay(title: "Error", description: error!)
                }
                
            }
        }
    }
    
    @IBAction func signupButtonPressed(_ sender: AnyObject) {
        self.view.endEditing(true)
    }
    
    
//MARK: - Custom Methods
    
    func callServerForData(user:UserModel){
        user.login { [weak self] (data, error) in
            if let weakSelf = self {
                if(error != nil){
                    //error has occured while calling server. Inform user
                    weakSelf.alertDisplay(title: "Server Error", description: error!)
                }
                else{
                    //data successfully received from server.parse it and store it. then navigate to the homescreen
                    
//                    {
//                        key = 8c8ss4os08s0s8s044ooooswc8cok888wgo8o0wo;
//                        status = "Login Successful";
//                    }
                    
                    sharedUserManager.save(user: UserModel())
                    weakSelf.alertDisplay(title: "Server Success", description: "Wohoo")

                    weakSelf.gotoHomeScreen(controllerName: .HomeController)
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

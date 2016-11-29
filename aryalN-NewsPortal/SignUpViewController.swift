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
        
        signupButton.layer.cornerRadius = signupButton.bounds.size.height / 2.0
        editTextField(usernameTextfield)
        editTextField(emailTextField)
        editTextField(passwordTextField)
        editTextField(confirmPasswordTextfield)
        
    }

//MARK: - Button Methods
    
    @IBAction func signInButtonPressed(_ sender: AnyObject) {
        if let toBePopedNavigation = self.navigationController{
        toBePopedNavigation.popViewController(animated: true)
        }
    }
    
    @IBAction func signupButtonPressed(_ sender: AnyObject) {
    }
    
//MARK: - View Editing Methods
    
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

//
//  SELoginViewController.swift
//  exit-ios
//
//  Created by lotco on 13/10/2019.
//  Copyright © 2019 lotco. All rights reserved.
//

import UIKit

class SELoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBAction func userRegisterButtonAction(_ sender: Any) {
        
        print("register", self.emailTextField.text! , self.passwordTextField.text!, self.userNameTextField.text!);
        
        
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
        print("login", self.emailTextField.text! , self.passwordTextField.text!, self.userNameTextField.text!);
        
        
        SEAPIController.shared.login(email: "21", password: "asd", completeHandler: {
            print("complete!!!")
        })
//        SEAPIController.shared.login(email: self.emailTextField.text!, password: self.userNameTextField.text!)
    }
    
    @IBAction func closeButtonAction(_ sender: Any) {
        self.dismiss(animated: true) {
            print("login view close", self.emailTextField.text! , self.passwordTextField.text!, self.userNameTextField.text!);
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("login view")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(touches)
        self.view.endEditing(true);
        closeButtonAction([]);
        
//        regiButtonAction(nil);
//        userRegisterButtonAction([]);
    }
}

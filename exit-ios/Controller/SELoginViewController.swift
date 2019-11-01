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
        
        SEAPIController.shared.userRegister(email: self.emailTextField.text!,
                                            password: self.passwordTextField.text!,
                                            userName: userNameTextField.text!,
                                            completeHandler: {
                                                print("회원 가입 완료");
        })
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
        print("login", self.emailTextField.text! , self.passwordTextField.text!, self.userNameTextField.text!);
        
        
        let user:SEUser = SEUser();
        
        SEAPIController.shared.login(email:self.emailTextField.text!,
                                  password: self.passwordTextField.text!,
                           completeHandler:{response in
                            user.userName = response.response!.allHeaderFields["x-access-token"] as? String
                            
                            print("complete!!!" , response)
                            print("user token!!!" , user)
                            
                            self.dismiss(animated: true) {
                                print("dismiss login view")
                            }
        })
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

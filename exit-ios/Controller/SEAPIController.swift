//
//  SEAPIController.swift
//  exit-ios
//
//  Created by lotco on 19/10/2019.
//  Copyright © 2019 lotco. All rights reserved.
//

import UIKit
import Alamofire

class SEAPIController: NSObject {
    static let shared = SEAPIController()
       
    private override init() {}
       
    //    let host:String = "http://lotco.de:3000/api/v1/"
    let host:String = "http://localhost:3000/api/v1/"

    func login(email:String!, password:String!) -> String{
        AF.request(host+"login",
                   method:.post,
                   parameters:[
                    "email"     : email,
                    "password"  : password,
        ]).responseJSON{response in
            print(response.response!.allHeaderFields["x-access-token"] ?? "로그인 토큰 없음");
            print(response)
        }
        return "야호"
    }
    
//    AF.request(host+"users",
//               method:.post,
//               parameters:[
//                "email"     : self.emailTextField.text!,
//                "password"  : self.passwordTextField.text!,
//                "userName"  : self.userNameTextField.text!
//    ]).responseJSON{response in
//        print(response)
//    }
    
    @discardableResult
    func printMessage(message: String) -> String {
        let outputMessage = "Output : \(message)"
        print(outputMessage)
       
        return outputMessage
    }
    
    
    
    
    
    
}

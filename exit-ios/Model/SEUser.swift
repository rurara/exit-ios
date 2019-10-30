//
//  SEUser.swift
//  exit-ios
//
//  Created by lotco on 28/10/2019.
//  Copyright © 2019 lotco. All rights reserved.
//

import UIKit

class SEUser: NSObject {
    public var userToken:String!;
    public var userName:String!;
    public var userPoint:NSNumber!;
    
    override init() {
        print("user init!");
    }
    
    override var description: String{
        var message:String = String();
        
        if ((userToken) != nil){
            message = message + "//user token = " + userToken;
        }
        if ((userName) != nil){
            message = message + "//user name = " + userName;
        }
        if ((userPoint) != nil){
            message = message + "//user point = " + userPoint.stringValue;
        }
        
        return message;
    }
}

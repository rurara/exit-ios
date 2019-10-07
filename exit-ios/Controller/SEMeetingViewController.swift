//
//  SEMeetingViewController.swift
//  exit-ios
//
//  Created by lotco on 2019/09/30.
//  Copyright © 2019 lotco. All rights reserved.
//

import UIKit
import Alamofire

#if di
#else
#endif

class SEMeetingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("yaho");
        
        AF.request("http://localhost:3000/api/v1/test", method:.post, parameters: nil).responseJSON{response in print(response)}
    }
    /*
}

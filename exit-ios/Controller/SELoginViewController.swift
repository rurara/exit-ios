//
//  SELoginViewController.swift
//  exit-ios
//
//  Created by lotco on 13/10/2019.
//  Copyright © 2019 lotco. All rights reserved.
//

import UIKit

class SELoginViewController: UIViewController {

    @IBAction func closeButtonAction(_ sender: Any) {
        self.dismiss(animated: true) {
            print("login view close");
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("login view")
    }
}

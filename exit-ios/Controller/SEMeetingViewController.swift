//
//  SEMeetingViewController.swift
//  exit-ios
//
//  Created by lotco on 2019/09/30.
//  Copyright © 2019 lotco. All rights reserved.
//

import UIKit
import Alamofire
import JTAppleCalendar


#if di
#else
#endif

class SEMeetingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("yaho");
        
        AF.request("http://localhost:3000/api/v1/test", method:.post, parameters: nil).responseJSON{response in print(response)}
    }
}


extension SEMeetingViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 25;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let time = Date();
        
        let cellTime = Calendar.current.date(byAdding: .day, value:indexPath.row, to:time)

        let date = DateFormatter()

        date.locale = Locale(identifier: "ko_kr")
        date.dateFormat = "yyyy-MM-dd"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.backgroundView?.backgroundColor = UIColor.init(displayP3Red: 0, green: 0.3, blue: 0.3, alpha: 0.7)
        
        let textLabel:UILabel = cell.viewWithTag(50) as! UILabel;
        
        textLabel.text = date.string(from: cellTime ?? Date())
        return cell
    }
}

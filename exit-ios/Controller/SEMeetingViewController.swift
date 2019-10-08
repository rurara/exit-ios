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
    @IBOutlet weak var calendarView: JTACMonthView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("yaho");
        
        AF.request("http://localhost:3000/api/v1/test", method:.post, parameters: nil).responseJSON{response in print(response)}
    }
}

//JTACMonthViewDelegate,
extension SEMeetingViewController:  JTACMonthViewDataSource {
//    func calendar(_ calendar: JTACMonthView, willDisplay cell: JTACDayCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
//        <#code#>
//    }
//
//    func calendar(_ calendar: JTACMonthView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTACDayCell {
//        let myCustomCell = calendar.dequeueReusableCell(withReuseIdentifier: "dateCell", for: indexPath) as! CellView
//        configureVisibleCell(myCustomCell: myCustomCell, cellState: cellState, date: date, indexPath: indexPath)
//        return myCustomCell
//    }
    
    func configureCalendar(_ calendar: JTACMonthView) -> ConfigurationParameters {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy MM dd"
        let startDate = formatter.date(from: "2018 01 01")!
        let endDate = Date()
        return ConfigurationParameters(startDate: startDate, endDate: endDate)
    }
}

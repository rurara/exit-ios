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
    
    func handleConfiguration(cell: JTACDayCell?, cellState: CellState) {
        guard let cell = cell as? TestRangeSelectionViewControllerCell else { return }
        handleCellColor(cell: cell, cellState: cellState)
        handleCellSelection(cell: cell, cellState: cellState)
    }
    
    func handleCellColor(cell: TestRangeSelectionViewControllerCell, cellState: CellState) {
        if cellState.dateBelongsTo == .thisMonth {
            cell.label.textColor = .black
        } else {
            cell.label.textColor = .gray
        }
    }
    
    func handleCellSelection(cell: TestRangeSelectionViewControllerCell, cellState: CellState) {
        cell.selectedView.isHidden = !cellState.isSelected
        if #available(iOS 11.0, *) {
            switch cellState.selectedPosition() {
            case .left:
                cell.selectedView.layer.cornerRadius = 20
                cell.selectedView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
            case .middle:
                cell.selectedView.layer.cornerRadius = 0
                cell.selectedView.layer.maskedCorners = []
            case .right:
                cell.selectedView.layer.cornerRadius = 20
                cell.selectedView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
            case .full:
                cell.selectedView.layer.cornerRadius = 20
                cell.selectedView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner]
            default: break
            }
        
        }
    
    
    }

}

//JTACMonthViewDelegate,
extension SEMeetingViewController:  JTACMonthViewDataSource, JTACMonthViewDelegate{
    
    func calendar(_ calendar: JTACMonthView, willDisplay cell: JTACDayCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        handleConfiguration(cell: cell, cellState: cellState)
    }

    func calendar(_ calendar: JTACMonthView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTACDayCell {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "dateCell", for: indexPath) as! TestRangeSelectionViewControllerCell
        cell.label.text = cellState.text
        self.calendar(calendar, willDisplay: cell, forItemAt: date, cellState: cellState, indexPath: indexPath)
        print("asd");
        return cell
    }

//    func calendar(_ calendar: JTACMonthView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
//        setupMonthLabel(date: visibleDates.monthDates.first!.date)
//    }

    func calendar(_ calendar: JTACMonthView, didSelectDate date: Date, cell: JTACDayCell?, cellState: CellState) {
        handleConfiguration(cell: cell, cellState: cellState)
    }

    func calendar(_ calendar: JTACMonthView, didDeselectDate date: Date, cell: JTACDayCell?, cellState: CellState) {
        handleConfiguration(cell: cell, cellState: cellState)
    }

    func configureCalendar(_ calendar: JTACMonthView) -> ConfigurationParameters {
        let df = DateFormatter()
        df.dateFormat = "yyyy MM dd"
        
        let startDate = df.date(from: "2017 01 01")!
        let endDate = df.date(from: "2017 12 31")!
        
        let parameter = ConfigurationParameters(startDate: startDate,
                                                endDate: endDate,
                                                numberOfRows: 6,
                                                generateInDates: .forAllMonths,
                                                generateOutDates: .tillEndOfGrid,
                                                firstDayOfWeek: .sunday)
        print("asdasd22");
        return parameter
    }
    
}



class TestRangeSelectionViewControllerCell: JTACDayCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var selectedView: UIView!
}

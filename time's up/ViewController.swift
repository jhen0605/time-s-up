//
//  ViewController.swift
//  time's up
//
//  Created by 簡吟真 on 2021/6/17.
//

import UIKit
import Foundation
import SpriteKit

class ViewController: UIViewController {

    @IBOutlet weak var todayLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var hLabel: UILabel!
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var sLabel: UILabel!
    
    let dateFormatter = DateFormatter()
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        //今天日期
               let today = Date()
        let dateComponents = Calendar.current.dateComponents(in: TimeZone.current, from: today)
               dateFormatter.dateFormat = "yyyy/MM/dd"
               let dateString = dateFormatter.string(from: today)
               todayLabel.text = dateString
               print(dateString)
     
    }

    
    @IBAction func startBtn(_ sender: UIButton) {

        //取得使用者輸入的工作日
        let date2 = datePicker.date
        dateFormatter.dateFormat = "yyyy/MM/dd"
        let dayString = dateFormatter.string(from: date2)
        dateLabel.text = dayString
        
        
        //倒數
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [self]_ in
            let interval = Int(date2.timeIntervalSinceNow)
            let day = interval / 60 / 60 / 12
            let hrs = interval / 60 / 60 % 24
            let min = interval / 60 % 60
            let sec = interval % 60

            self.sLabel.text = "\(sec)"
            self.mLabel.text = "\(min)"
            self.hLabel.text = "\(hrs)"
            self.dayLabel.text = "\(day)"
            
        
    
    }
    }
        override func viewDidDisappear(_ animated: Bool) {
            if timer != nil {
                timer?.invalidate()
}

}
            }

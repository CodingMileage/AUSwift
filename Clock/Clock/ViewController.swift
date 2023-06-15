//
//  ViewController.swift
//  Clock
//
//  Created by Brandon on 6/14/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    
    
    @IBOutlet weak var TimerLabel: UILabel!
    @IBOutlet weak var startStopButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    var timer:Timer = Timer()
    var count:Int = 0
    var timerCounting:Bool = false
    
    let months:[String] = ["January", "February", "March", "April" , "May", "June", "July", "August", "September", "October", "November", "December"]
    
    fileprivate func startTime() {
        
         Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (_) in
            
            let date = Date()
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEE, MMM d yyy HH:mm:ss"
            
            let currentTime = dateFormatter.string(from: date)
            
            dateFormatter.dateFormat = "dd/MM/yyyy"
            
            let calendar = Calendar.current
            let month = calendar.component(.month, from: date)
            let day = calendar.component(.day, from: date)
            let monthInWords = self.months[month - 1]
            
            var dayString = String(day)
            
            
            let lastChar = dayString.last!
            
            if lastChar == "1" {
                dayString = dayString+"st"
            } else if lastChar == "2" {
                dayString = dayString+"nd"
            } else if lastChar == "3" {
                dayString = dayString+"rd"
            } else {
                dayString = dayString+"th"
            }
            
            let year = calendar.component(.year, from: date)
            
            let currentDate = "\(dayString) \(monthInWords), \(year)"
            
            self.timeLabel.text = currentTime
            
            
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startStopButton.setTitleColor(UIColor.green, for: .normal)
        startTime()
        
    }
    
    
    @IBAction func resetTapped(_ sender: Any)
    {
        let alert = UIAlertController(title: "Reset Timer?", message: "Proceeding will reset the timer.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "CANCEL", style: .cancel, handler: { (_) in
            //do nothing
        }))
        
        alert.addAction(UIAlertAction(title: "YES", style: .default, handler: { (_) in
            self.count = 0
            self.timer.invalidate()
            self.TimerLabel.text = self.makeTimeString(hours: 0, minutes: 0, seconds: 0)
            self.startStopButton.setTitle("Start", for: .normal)
            self.startStopButton.setTitleColor(UIColor.green, for: .normal)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    

    @IBAction func startStopTapped(_ sender: Any)
    {
        if(timerCounting)
        {
            timerCounting = false
            timer.invalidate()
            startStopButton.setTitle("Start", for: .normal)
            startStopButton.setTitleColor(UIColor.green, for: .normal)
        }
        else
        {
            timerCounting = true
            startStopButton.setTitle("Stop", for: .normal)
            startStopButton.setTitleColor(UIColor.red, for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
        }
    }
    
    
    @objc func timerCounter() -> Void
    {
        count = count + 1
        let time = secondsToHoursMinutesSeconds(seconds: count)
        let timeString = makeTimeString(hours: time.0, minutes: time.1, seconds: time.2)
        TimerLabel.text = timeString
    }
    
    func secondsToHoursMinutesSeconds(seconds: Int) -> (Int, Int, Int)
    {
        return ((seconds / 3600), ((seconds % 3600) / 60),((seconds % 3600) % 60))
    }
    
    func makeTimeString(hours: Int, minutes: Int, seconds : Int) -> String
    {
        var timeString = ""
        timeString += String(format: "%02d", hours)
        timeString += " : "
        timeString += String(format: "%02d", minutes)
        timeString += " : "
        timeString += String(format: "%02d", seconds)
        return timeString
    }
    
}


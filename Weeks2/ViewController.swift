//
//  ViewController.swift
//  Weeks2
//
//  Created by Jonathan Ma on 4/29/16.
//  Copyright © 2016 Jonathan Ma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var dateTextField: UITextField!
    
    @IBAction func textFieldEditing(sender: UITextField) {
        let datePickerView:UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.Date
        datePickerView.backgroundColor = UIColor(red:0.12, green:0.13, blue:0.14, alpha:1.0)
        datePickerView.setValue(UIColor.whiteColor(), forKeyPath: "textColor")
        datePickerView.setValue(0.8, forKeyPath: "alpha")
        datePickerView.maximumDate = NSCalendar.currentCalendar().dateByAddingUnit([.Year, .Month, .Day], value: 0, toDate: NSDate(), options: [])
        datePickerView.minimumDate = NSCalendar.currentCalendar().dateByAddingUnit(.Year, value: -90, toDate: NSDate(), options: [])
        sender.inputView = datePickerView
        datePickerView.addTarget(self,
                                action: #selector(ViewController.datePickerValueChanged(_:)),
                                forControlEvents: UIControlEvents.ValueChanged)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Colors.lightgray
        self.addDoneButtonOnKeyboard()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func datePickerValueChanged(sender:UIDatePicker) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
        
        let dateFormatter2 = NSDateFormatter()
        dateFormatter2.dateStyle = NSDateFormatterStyle.FullStyle
        dateFormatter2.timeStyle = NSDateFormatterStyle.NoStyle

        let now = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Day , .Month , .Year], fromDate: now)
        let yearNow =  components.year
        let monthNow = components.month
        let dayNow = components.day
        
        let userAge  = now.yearsFrom(sender.date)
        let userBirthdayString = dateFormatter2.stringFromDate(sender.date)
        
        let components2 = calendar.components([.Day , .Month , .Year], fromDate: sender.date)
        let yearBirth =  components2.year
        let monthBirth = components2.month
        let dayBirth = components2.day
        let nextYearBirth =  ((userAge + 1) + yearBirth)
        
        let nextBirthday = NSCalendar.currentCalendar().dateWithEra(1, year:nextYearBirth, month: monthBirth, day: dayBirth, hour: 0, minute: 0, second: 0, nanosecond: 0)
        
        let userWeeksTilNextBirthday = nextBirthday!.weeksFrom(now)
        let userDaysTilNextBirthday = nextBirthday!.daysFrom(now) - (userWeeksTilNextBirthday * 7)

        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setValue(yearNow, forKey: "yearNow") // curent year
        defaults.setValue(monthNow, forKey: "monthNow") // current month
        defaults.setValue(dayNow, forKey: "dayNow") // current day
        
        defaults.setValue(yearBirth, forKey: "yearBirth") // birth year
        defaults.setValue(monthBirth, forKey: "monthBirth") // birth month
        defaults.setValue(dayBirth, forKey: "dayBirth") // birth day
        
        defaults.setValue(userBirthdayString, forKey: "userBirthdayString")
        defaults.setValue(nextBirthday, forKey: "nextBirthday")
        defaults.setValue(sender.date, forKey: "bDate")
        defaults.setValue(userAge, forKey: "userAge")
        defaults.setValue(userWeeksTilNextBirthday, forKey: "userWeeksTilNextBirthday")
        defaults.setValue(userDaysTilNextBirthday, forKey: "userDaysTilNextBirthday")
        
//        print(userBirthdayString)
//        print(nextBirthday)
//        print(userWeeksTilNextBirthday)
//        print(userDaysTilNextBirthday)
//        print(nextYearBirth)
//        print(yearNow)
        
        dateTextField.text = dateFormatter.stringFromDate(sender.date)
    }
    
    func addDoneButtonOnKeyboard()
    {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRectMake(0, 0, 320, 50))
        doneToolbar.barStyle = UIBarStyle.Default
        doneToolbar.barTintColor = UIColor(red:0.12, green:0.13, blue:0.14, alpha:1.0)
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Done, target: self, action: #selector(ViewController.doneButtonAction))
        done.tintColor = UIColor.whiteColor()
        
        var items: [UIBarButtonItem] = []
        items.append(flexSpace)
        items.append(done)
        
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        self.dateTextField.inputAccessoryView = doneToolbar
        
    }
    
    @IBAction func doneButtonAction()
    {
        self.dateTextField.resignFirstResponder()
        let defaults = NSUserDefaults.standardUserDefaults()
        let userBirthday = defaults.objectForKey("userBirthdayString") as? String ?? String()
        
        let message = "You were born on a \(userBirthday)"
        let alert = UIAlertController(
            title: "Birthday",
            message: message,
            preferredStyle: .Alert)
        let yes = UIAlertAction(
            title: "That's so true!",
            style: .Default,
            handler: { (_) -> Void in
                self.performSegueWithIdentifier("1YearView", sender: self)
        })
        let nope = UIAlertAction(
            title: "Nope",
            style: .Cancel,
            handler: {(_) -> Void in
                self.dateTextField.resignFirstResponder()
                self.dateTextField.text = ""
        })
        
        alert.addAction(yes)
        alert.addAction(nope)
        presentViewController(alert, animated: true, completion: nil)
      
    }
    

}


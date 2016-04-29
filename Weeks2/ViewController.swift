//
//  ViewController.swift
//  Weeks2
//
//  Created by Jonathan Ma on 4/29/16.
//  Copyright © 2016 Jonathan Ma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    struct globalvar {
        static var userBirthday = ""
    }


    @IBOutlet weak var dateTextField: UITextField!
    
    @IBAction func textFieldEditing(sender: UITextField) {
        let datePickerView:UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.Date
        datePickerView.backgroundColor = UIColor(red:0.12, green:0.13, blue:0.14, alpha:1.0)
        datePickerView.setValue(UIColor.whiteColor(), forKeyPath: "textColor")
        datePickerView.setValue(0.8, forKeyPath: "alpha")
        
        sender.inputView = datePickerView
        datePickerView.addTarget(self,
                                action: "datePickerValueChanged:",
                                forControlEvents: UIControlEvents.ValueChanged)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        let userBirthday = globalvar.userBirthday
        globalvar.userBirthday = dateFormatter2.stringFromDate(sender.date)
        
        dateTextField.text = userBirthday
        
    }
    
    func addDoneButtonOnKeyboard()
    {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRectMake(0, 0, 320, 50))
        doneToolbar.barStyle = UIBarStyle.Default
        doneToolbar.barTintColor = UIColor(red:0.12, green:0.13, blue:0.14, alpha:1.0)
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Done, target: self, action: Selector("doneButtonAction"))
        done.tintColor = UIColor.whiteColor()
        
        var items: [UIBarButtonItem] = []
        items.append(flexSpace)
        items.append(done)
        
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        self.dateTextField.inputAccessoryView = doneToolbar
        
    }
    
    func doneButtonAction()
    {
        self.dateTextField.resignFirstResponder()
        let userBirthday = globalvar.userBirthday
        
        let message = "You were born on a \(userBirthday)"
        let alert = UIAlertController(
            title: "Birthday",
            message: message,
            preferredStyle: .Alert)
        let yes = UIAlertAction(
            title: "That's so true!",
            style: .Default,
            handler: {action in self.Next()})
        let nope = UIAlertAction(
            title: "Nope",
            style: .Cancel,
            handler: {action in self.Redo()})
        
        alert.addAction(yes)
        alert.addAction(nope)
        presentViewController(alert, animated: true, completion: nil)
      
    }
    
    func Redo(){
        self.dateTextField.resignFirstResponder()
        let userBirthday = globalvar.userBirthday
        globalvar.userBirthday = ""
        self.dateTextField.text = userBirthday
        
    }
    
    func Next() {
        let secondVC = SecondViewController(nibName: "SecondView", bundle: nil)
        let navController = UINavigationController(rootViewController: secondVC)
        self.presentViewController(navController, animated: true, completion: nil)

    }
  

}


//
//  ViewController.swift
//  Q11_DOBPickerApplication
//
//  Created by Yash Singh on 7/9/18.
//  Copyright © 2018 Yash Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var dateOfBirth: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var datePickerHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let date = Date()
        print(date)
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-YYYY"
    }

    @IBAction func datePickerAction(_ sender: UIDatePicker) {
//        let formatterOfDate = DateFormatter()
//        formatterOfDate.dateFormat = "dd-MM-YYYY"
//        let datestring = formatterOfDate.string(from: sender.date)
//        dateOfBirth.text = datestring
   }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        showDatePicker()
        
        return false
    }
    
    
    @IBAction func doneButtonAction(_ sender: UIButton) {
        let doneButtonFormatter = DateFormatter()
        doneButtonFormatter.dateFormat = "dd-MM-YYYY"
        let datestringDoneButton = doneButtonFormatter.string(from: datePicker.date)
        dateOfBirth.text = datestringDoneButton
        hideDatePicker()
    }
    
    
    func showDatePicker()
    {
        datePickerHeightConstraint.constant = 162
        self.view.layoutIfNeeded()
    }
    
    func hideDatePicker()
    {
        datePickerHeightConstraint.constant = 0
        self.view.layoutIfNeeded()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


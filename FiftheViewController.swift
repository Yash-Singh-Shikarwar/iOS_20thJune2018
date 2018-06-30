//
//  FiftheViewController.swift
//  DemoStoryBoard29thJune
//
//  Created by Yash Singh on 6/29/18.
//  Copyright © 2018 Yash Singh. All rights reserved.
//

import Foundation
import UIKit

class FifthViewController: UIViewController
{
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    /*  we wanna pop back to the 1st screen so we can't use a popViewController or else we get back to the 4th controller
     
     */
    
    @IBAction func FifthVCPop(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

//
//  ThirdViewController.swift
//  DemoStoryBoard29thJune
//
//  Created by Yash Singh on 6/29/18.
//  Copyright © 2018 Yash Singh. All rights reserved.
//

import Foundation
import UIKit

class ThirdViewController: UIViewController
{
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func ThirdVCActionButton(_ sender: UIButton) {
        if let controller3 = storyboard?.instantiateViewController(withIdentifier: "FourthViewController") as? FourthViewController{
            navigationController?.pushViewController(controller3, animated: true)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

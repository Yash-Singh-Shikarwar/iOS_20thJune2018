//
//  SecondViewController.swift
//  DemoStoryBoard29thJune
//
//  Created by Yash Singh on 6/29/18.
//  Copyright © 2018 Yash Singh. All rights reserved.
//

import Foundation
import UIKit

class SecondViewController: UIViewController {
    
    //requirement: whenever push is pressed in controller 1, we wanna display "push" in the label of the 2nd view controller
    //create string variable and pass it in the viewDidLoad
    @IBOutlet weak var SecondVCLabel: UILabel!
    var strValue: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        SecondVCLabel.text = strValue
    }
    
    
    
    @IBAction func SecondVCPushAction(_ sender: UIButton) {
        
        if let controller2 = storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") as? ThirdViewController{
            navigationController?.pushViewController(controller2, animated: true)
        
    }
    }
    @IBAction func PopAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func DismissAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

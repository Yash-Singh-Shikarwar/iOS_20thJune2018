//
//  ViewController.swift
//  Q8_NavigateBetweenViewControllers
//
//  Created by Yash Singh on 7/9/18.
//  Copyright © 2018 Yash Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func pushButtonAction(_ sender: UIButton) {
        if let controller = storyboard?.instantiateViewController(withIdentifier: "PushedViewController") as? PushedViewController
        {
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    
    @IBAction func presentButtonAction(_ sender: UIButton) {
        if let controller = storyboard?.instantiateViewController(withIdentifier: "PresentedViewController") as? PresentedViewController
        {
            present(controller, animated: true, completion: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


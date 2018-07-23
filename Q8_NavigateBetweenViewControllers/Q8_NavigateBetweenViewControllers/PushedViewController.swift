//
//  PushedViewController.swift
//  Q8_NavigateBetweenViewControllers
//
//  Created by Yash Singh on 7/9/18.
//  Copyright © 2018 Yash Singh. All rights reserved.
//

import UIKit

class PushedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func popButtonAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

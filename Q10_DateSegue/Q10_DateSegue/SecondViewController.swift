//
//  SecondViewController.swift
//  Q10_DateSegue
//
//  Created by Yash Singh on 7/9/18.
//  Copyright © 2018 Yash Singh. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var dateLabel: UILabel!
    var strValue: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        dateLabel.text = strValue

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

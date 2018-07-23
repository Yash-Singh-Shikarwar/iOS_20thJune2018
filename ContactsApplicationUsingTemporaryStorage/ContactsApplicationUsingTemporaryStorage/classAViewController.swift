//
//  classAViewController.swift
//  ContactsApplicationUsingTemporaryStorage
//
//  Created by Yash Singh on 7/10/18.
//  Copyright © 2018 RJTCompuquest. All rights reserved.
//

import UIKit

var kUsername = "CR7"
class classAViewController: UIViewController, classBProtocol {
    
    @IBOutlet weak var testLabel: UILabel!
    
    func testingDelegateMethod(strValue: String) {
        testLabel.text = strValue
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //add observer for notification
        NotificationCenter.default.addObserver(self, selector: #selector(updateLabelText(_ :)), name: NSNotification.Name(rawValue: kUsername), object: nil)
        
        
        //CLOSURES------------------------------------------------
        let arrName = ["Stannis", "Robert", "Renly"]
        //sort the above array
        let sortedArr = arrName.sorted(by: {$0<$1})     //$0 means 1st value of the array and $1 is the next value.. This is where the closure is defined. Only $0 and $1 work, not $2 or 3 or whatever
        
        print(sortedArr)
        
        //maps
        let values = [2,3,4,5,6]
        //we need to add every element to itself. ie we need 4,6,8,10,12
        let addValue = values.map({$0 + $0})   //->closure used in flat map here. We are mapping every value in addValue to values
        print("\(addValue)")
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    @objc func updateLabelText(_ notification: Notification)
    {
        print(notification.object)
        if let val = notification.object as? String{   //downcasting an object of type any to String using as?
            testLabel.text = val
        }
    }
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? classBViewController
        {           //need to set delegate to self-> VERY IMPORTANT
            controller.delegateVar = self   //TO GET INSTANCE OF NEXT CONTROLLER
            
            //Typealias closure used here
            //update the label using the closure
            controller.tappedOrNot = {[unowned self] (obj1, obj2) in
                self.testLabel.text = obj1 as? String}
            
        }
    }

}

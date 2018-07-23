//
//  classBViewController.swift
//  ContactsApplicationUsingTemporaryStorage
//
//  Created by Yash Singh on 7/10/18.
//  Copyright © 2018 RJTCompuquest. All rights reserved.
//

import UIKit

@objc protocol classBProtocol: class{
    func testingDelegateMethod(strValue: String)   //definition of the function is in class A because we wanna use it in class A
    
    @objc optional func testDelegateMethodOptional(intValue: Int)       //an optional method- ie may or may not be used, not ? method
}

//TypeAlias closure
public typealias ActionTappedBlock = (_ obj1: Any, _ obj2: Any) -> ()

class classBViewController: UIViewController {
    
    weak var delegateVar : classBProtocol?

    //define typealias variable
    var tappedOrNot : ActionTappedBlock?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Class B"

        // Do any additional setup after loading the view.
    }

    @IBAction func backButtonAction(_ sender: UIButton) {
//        delegateVar?.testingDelegateMethod(strValue: "Winter is coming")     //delegate protocol
//        NotificationCenter.default.post(name: Notification.Name(rawValue : kUsername), object: "Ours is the fury")
        
        tappedOrNot?("We are the champions", 10)  //now use the closure in the class A where the instance of the next controller is defined
        
        navigationController?.popViewController(animated: true)
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

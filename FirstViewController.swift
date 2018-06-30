//
//  ViewController.swift
//  DemoStoryBoard29thJune
//
//  Created by Yash Singh on 6/29/18.
//  Copyright © 2018 Yash Singh. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBAction func ButtonPresentAction(_ sender: UIButton) {
        if let controller = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController{
            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func ButtonPushAction(_ sender: UIButton) {
        if let controller = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController{
            navigationController?.pushViewController(controller, animated: true)
            
            //we need to print push into the 2nd view controller's label
            //this function is of type SecondViewController class so strValue from the SecondViewController will work for controller
            controller.strValue = "Push"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //createANavigationBarButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //to create a navigation bar
   /* func createANavigationBarButton()
    {
        let editBarButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editBarButtonAction))
        navigationItem.leftBarButtonItem = editBarButton
        
        let addBarButton =
            UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addBarButtonAction))
        navigationItem.rightBarButtonItem = addBarButton
    }
    @objc func editBarButtonAction()
    {
        
    }
    @objc func addBarButtonAction()
    {
        
    }*/
    
    //using storyboard
    @IBAction func editBarButtonAction(_ sender: UIBarButtonItem) {
        
        let alertcontroller = UIAlertController(title: "Alert", message: "Test message", preferredStyle: .alert/*.alert displays in the centre,.actionSheet for alert to be displayed at the bottom of the screen*/)
        
        let okaction = UIAlertAction(title: "OK", style: .default, handler: nil)//handler is nil for now, but we can use it later in order to create response beyond just a notification cancel.. Topic (closure) comes later but the below code is the one we should keep in mond
        /*
         let okaction = UIAlertAction(title: "OK", style: .default)
         {
         (action) in
         print("Reynes of Castamere")
         }
         */
        
        alertcontroller.addAction(okaction)
        
        present(alertcontroller, animated: true, completion: nil)
    }
    
    @IBAction func addBaruButtonAction(_ sender: UIBarButtonItem) {
    }
    
    /*If you wanna use segue instead of the above IBAction*/
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? SecondViewController{
            
            if segue.identifier == "newIdentifier"
            {
                controller.strValue = "Present"
            }
            if segue.identifier == "Identifier1"
            {
                controller.strValue = "Push"
                
            }
            
            //ternary operator implementation:
            //controller.strValue = segue.identifier == "newIdentifier" ? "Present":"Push"
        }
    }
 


}


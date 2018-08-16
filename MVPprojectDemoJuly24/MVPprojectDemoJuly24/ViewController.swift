//
//  ViewController.swift
//  MVPprojectDemoJuly24
//
//  Created by Yash Singh on 7/24/18.
//  Copyright © 2018 Yash Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    var loginPresenterObject: LoginPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginPresenterObject = LoginPresenter(delegate: self)
        //The above line works because of protocol conformance. If the type that you pass a value of the type of protocol, that our viewController is conforming to. It means that we are saying that the class is obeying all the rules of the protocol, so it can get the object self which is also of the type LoginProtocol
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func loginButton(_ sender: UIButton) {
        loginPresenterObject?.authenticateUser(userName: nameTextField.text!, password: passwordTextField.text!)
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

//extension of our viewController following the LoginProtocol
extension ViewController: LoginProtocol
{
    func didStartFetching() {
        //get the cocoapods stuff for HUD
    }
    
    func didFinishFetching() {
        <#code#>
    }
    
func didAuthenticateSuccessfully()
{
    performSegue(withIdentifier: "Fury", sender: self)
}

func didAuthenticateFailure(_ errorMessage: String) {
    //print("When you play the Game of Thrones you win or you die")
    print(errorMessage)  //prints the default message in LoginPresenter
}
    
}

//
//  LoginPresenter.swift
//  MVPprojectDemoJuly24
//
//  Created by Yash Singh on 7/24/18.
//  Copyright © 2018 Yash Singh. All rights reserved.
//

import UIKit

class LoginPresenter: NSObject {

    //delegate helps us to communicate between presenter and the controller in MVP
    var loginDelegate: LoginProtocol
    init(delegate: LoginProtocol){
        loginDelegate = delegate
    }
    
    //this is our business logic
    //pass the arguments in ViewController using the protocol
    func authenticateUser(userName: String, password: String) 
    {
        if userName == "Robert Baratheon" && password == "Breastplate Stretcher"{
            //call network layer function here
            loginDelegate.didAuthenticateSuccessfully()
        }else{
            loginDelegate.didAuthenticateFailure("The king is too fat for his armour!")
        }
    }
    
    //do the countryList
//    func fetchCountryAPI()    {
//        loginDelegate.didStartFetching()
//        NetworkLayer.sharedInstance.getCountryFlagImage { (<#Array<Country>#>, <#Error?#>) in
//            do catch ->-> let data = try Data(contentsOf: url)
//        }
//
    
}

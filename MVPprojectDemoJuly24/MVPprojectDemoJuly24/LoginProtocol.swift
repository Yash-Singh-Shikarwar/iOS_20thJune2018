//
//  LoginProtocol.swift
//  MVPprojectDemoJuly24
//
//  Created by Yash Singh on 7/24/18.
//  Copyright © 2018 Yash Singh. All rights reserved.
//

import Foundation

protocol LoginProtocol{
    
    func didAuthenticateSuccessfully()
    
    func didAuthenticateFailure(_ errorMessage: String)   //can use errorMessage: inout String to make this errorMessage modifiable in the extension
    
    func didStartFetching()
    func didFinishFetching()
    
    
    
}

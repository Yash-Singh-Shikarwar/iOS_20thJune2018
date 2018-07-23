//
//  String+Helper.swift
//  ContactsApplicationUsingTemporaryStorage
//
//  Created by Yash Singh on 7/10/18.
//  Copyright © 2018 RJTCompuquest. All rights reserved.
//

import UIKit


//now these functions can be used ANYWHERE in the project
extension String
{
    var length : Int{   //used in viewDidLoad of DetailsViewController
        return self.count     //self means string here
    }
    
    var upCase: String{ //used in viewDidLoad of DetailsViewController
        return self.uppercased()        //returns uppercase of string
    }
    
}



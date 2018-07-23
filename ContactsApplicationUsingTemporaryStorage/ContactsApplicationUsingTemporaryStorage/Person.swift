//
//  Person.swift
//  ContactsApplicationUsingTemporaryStorage
//
//  Created by Ady on 7/9/18.
//  Copyright © 2018 RJTCompuquest. All rights reserved.
//

import Foundation

/*
struct Person {
    var firstName: String
    var lastName: String
    var email: String
    var age: String
}
*/
class Person: NSObject {
    var firstName: String
    var lastName: String
    var email: String
    var age: String
    
    init(fname: String, lname: String, emailID:String, ageP: String) {
        firstName = fname
        lastName = lname
        email = emailID
        age = ageP
    }
}

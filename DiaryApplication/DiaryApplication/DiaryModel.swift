//
//  DiaryModel.swift
//  DiaryApplication
//
//  Created by Yash Singh on 7/12/18.
//  Copyright © 2018 Yash Singh. All rights reserved.
//

import UIKit

class DiaryModel: NSObject, NSCoding {
    
    
    var title: String
    var thought: String
    var imageName: String
    var age: Int
    //var phoneNumber: Int
    
    init(noteTitle: String, noteThought: String, noteImage: String, noteAge: Int)
    {
        title = noteTitle
        thought = noteThought
        imageName = noteImage
        age = noteAge
       //phoneNumber = noteNumber
    }
    
    func encode(with aCoder: NSCoder) {
        //encode object using a key
        aCoder.encode(title, forKey: "Title")
        aCoder.encode(thought, forKey: "Thought")
        aCoder.encode(imageName, forKey: "Image Name")
        aCoder.encode(age, forKey: "Age")
        //aCoder.encode(phoneNumber, forKey: "Phone Number")
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let title = aDecoder.decodeObject(forKey: "Title") as? String, let thought = aDecoder.decodeObject(forKey: "Thought") as? String, let image = aDecoder.decodeObject(forKey: "Image Name") as? String, let age = aDecoder.decodeInteger(forKey: "Age") as? Int else{
            return nil
            
        }
        self.init(noteTitle: title, noteThought: thought, noteImage: image, noteAge: age)
    }
    
}

//
//  UserDefaults+Helper.swift
//  ContactsApplicationUsingTemporaryStorage
//
//  Created by Yash Singh on 7/10/18.
//  Copyright © 2018 RJTCompuquest. All rights reserved.
//

import UIKit

extension UserDefaults
{
    public func get(key:String) -> Any? {
        return UserDefaults.standard.value(forKey: key)
    }
    
    public func set(value: Any?, key: String, synchronize: Bool = true) {
        self.setValue(value, forKey: key)
        if synchronize {
            self.synchronize()
        }
    }
}

protocol someProtocol {
    static var name: Int { get set}
}

//
//  TestingExtension.swift
//  ContactsApplicationUsingTemporaryStorage
//
//  Created by Yash Singh on 7/10/18.
//  Copyright © 2018 RJTCompuquest. All rights reserved.
//

import UIKit

extension DetailsViewController: UITableViewDataSource{
    //numberOfRows defined here now in extension
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
}

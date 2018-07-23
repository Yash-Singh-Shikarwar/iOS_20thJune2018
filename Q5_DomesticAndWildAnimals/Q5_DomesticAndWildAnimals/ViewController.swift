//
//  ViewController.swift
//  Q5_DomesticAndWildAnimals
//
//  Created by Yash Singh on 7/9/18.
//  Copyright © 2018 Yash Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    

    @IBOutlet weak var animalTableView: UITableView!
    
    let animalsArr: [String] = ["Dog", "Cat", "Guinea Pig", "Lion", "Tiger", "Elephant", "Giraffe"]
    var count: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animalTableView.tableFooterView = UIView(frame: .zero)
        // Do any additional setup after loading the view, typically from a nib.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0
        {
            return 3
        }
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "animalCellIdentifier")

//        if indexPath.section == 0
//        {
//            switch indexPath.row
//            {
//            case 0:
//                cell?.textLabel?.text = animalsArr[indexPath.row]
//            case 1:
//                cell?.textLabel?.text = animalsArr[indexPath.row]
//            case 2:
//                cell?.textLabel?.text = animalsArr[indexPath.row]
//            default:
//                break
//            }
//
//        }
//        else if indexPath.section == 1
//        {
//            switch indexPath.row
//            {
//            case 0:
//                cell?.textLabel?.text = animalsArr[indexPath.row]
//            case 1:
//                cell?.textLabel?.text = animalsArr[indexPath.row]
//            case 2:
//                cell?.textLabel?.text = animalsArr[indexPath.row]
//            case 3:
//                cell?.textLabel?.text = animalsArr[indexPath.row]
//            default:
//                break
//            }
//        }
        cell?.textLabel?.text = animalsArr[count]
        count = count + 1

        return cell!
    }
    
    
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //need to display row number and section number
    let alertcontroller = UIAlertController(title: "Alert", message: "Row number: \(indexPath.row+1), Section number: \(indexPath.section+1)", preferredStyle: .alert)
    
    let okaction = UIAlertAction(title: "OK", style: .default, handler: nil)
    
    alertcontroller.addAction(okaction)
    present(alertcontroller, animated: true, completion: nil)
   }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0
        {
            return "Domestic Animals"
        }
        return "Wild Animals"
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


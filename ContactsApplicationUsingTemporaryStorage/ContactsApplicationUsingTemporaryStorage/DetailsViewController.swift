//
//  DetailsViewController.swift
//  ContactsApplicationUsingTemporaryStorage
//
//  Created by Ady on 7/9/18.
//  Copyright © 2018 RJTCompuquest. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController, UITextFieldDelegate {
    
   var appdelegate = UIApplication.shared.delegate as! AppDelegate
    var placeholderArr = ["FirstName", "LastName", "Email", "Age"]
    //var person = Person(firstName: "", lastName: "", email: "", age: "")
    var person : Person?

    var isNew: Bool = true
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if isNew {
           person =  Person(fname: "", lname: "", emailID: "", ageP: "")
        }
        let strValue = "Testing"
        //print("\(strValue.count)  ")         //now I wanna use a different function not .count => use extension
        
        print(strValue.length)
        print(strValue.upCase)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsTableViewCell") as? DetailsTableViewCell
        cell?.txtField.tag = indexPath.row
        cell?.txtField.delegate = self
      
        switch indexPath.row {
        case 0:
            cell?.txtField.placeholder = String(placeholderArr[0])
            cell?.txtField.text = person?.firstName
           
        case 1:
            cell?.txtField.placeholder = String(placeholderArr[1])
            cell?.txtField.text = person?.lastName
        case 2:
            cell?.txtField.placeholder = String(placeholderArr[2])
            cell?.txtField.text = person?.email
       
        default:
            cell?.txtField.placeholder = String(placeholderArr[3])
            cell?.txtField.text = person?.age
        }

        
        return cell!
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
       
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField.tag {
        case 0:
            person?.firstName = textField.text!
        case 1:
            person?.lastName = textField.text!
        case 2:
            person?.email = textField.text!
        default:
            person?.age = textField.text!
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func saveBtnAction(_ sender: UIBarButtonItem) {
        if let obj = person{
            if isNew {
                appdelegate.personArr.append(obj)
            }
            navigationController?.popViewController(animated: true)
        }
       
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

/*Extension 10th July*/
//creating extension of DetailsViewController


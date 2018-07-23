//
//  ViewController.swift
//  ContactsApplicationUsingTemporaryStorage
//
//  Created by Ady on 7/9/18.
//  Copyright © 2018 RJTCompuquest. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
  
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    
    //UISearchBar------------------------------------------
    
    
    var arrPerson = [Person.init(fname: "Lady", lname: "L", emailID: "lady@direwolf.got", ageP: "12"), Person.init(fname: "Summer", lname: "S", emailID: "summer@direwolf.got", ageP: "82"),
        Person.init(fname: "Ghost", lname: "G", emailID: "ghost@direwolf.got", ageP: "100"),
        Person.init(fname: "Nymeria", lname: "N", emailID: "nymeria@direwolf.got", ageP: "100"),
        Person.init(fname: "Shaggydog", lname: "S", emailID: "shaggydog@direwolf.got", ageP: "67"),
        Person.init(fname: "Grey Wind", lname: "W", emailID: "greywind@direwolf.got", ageP: "41")]
    
    var originalArray : Array<Person> = []    //use originalArray to create a copy of arrPerson in viewDidLoad
    //always do this to preserve old records whenever implementing the search bar
    
    @IBOutlet weak var searchBar: UISearchBar!      //search bar outlet
    
    @IBOutlet weak var contactsTblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        getArrayDictionary()
        originalArray = arrPerson
        contactsTblView.tableFooterView = UIView()
        getArrayString()
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchText = searchBar.text
        {
            if !searchText.isEmpty
            {
//                //either we can use predicate or the filter function for the array
//                //Let's use predicate first. Predicate is a class that we can use to filter the data
//                let predicate = NSPredicate(format: "firstname CONTAINS[C] %@", searchText)  //"___ CONTAINS[C] %@" is syntax for searching for the string C in ___
//                let filterArray = NSArray(array: originalArray)    //we create NSArray because regular array cannot use predicate
//                arrPerson = NSArray(array: filterArray.filtered(using: predicate)) as! [Person]
                
            arrPerson = originalArray.filter({$0.firstName.uppercased().contains(searchText.uppercased())})
                
                //if search text is contained within first name then this function returns
                //it's case sensitive... use firstName.uppercased and searchText.uppercased
                
                
            }
        }
        contactsTblView.reloadData()
        searchBar.resignFirstResponder()
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        arrPerson = originalArray
        searchBar.text = ""
        searchBar.resignFirstResponder()
        contactsTblView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        //sort the elements on the basis of first name if we select first name scope and last name if we select the last name scope
        if selectedScope == 0
        {
               // arrPerson = originalArray.sorted(by: {$0.firstName < $1.firstName})       //single sort
            arrPerson = originalArray.sorted(by: {($0.firstName, $0.age) < ($1.firstName, $1.age)})    //multiple sort ie sorting on multiple fields. Good for when the 1st field is tied

        }else
        {
            arrPerson = originalArray.sorted(by: {$0.lastName < $1.lastName})
            
        }
        contactsTblView.reloadData()
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //the bug so far was that we couldn't use the little cross so the code below deals with that
        if searchText.isEmpty{
            arrPerson = originalArray       //re-obtain the data from original array when cross is pressed ie when text is empty
            contactsTblView.reloadData()
        }
        else   //search while typing
        {
            if let searchingtext = searchBar.text
            {
                if !searchingtext.isEmpty
                {
                    arrPerson = originalArray.filter({$0.firstName.uppercased().contains(searchText.uppercased())})
                }
            }
        }
        contactsTblView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        contactsTblView.reloadData()
    }
    
    @IBAction func addBtnAction(_ sender: UIBarButtonItem) {
        if let controller = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController {
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrPerson.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier")
        //let obj = appdelegate.personArr[indexPath.row]
        let objectUsed = arrPerson[indexPath.row]
        cell?.textLabel?.text = objectUsed.firstName
        cell?.detailTextLabel?.text = objectUsed.lastName
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let controller = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController {
             let obj = appdelegate.personArr[indexPath.row]
            controller.person = obj
            controller.isNew = false
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    
    
    //PList-------------------------------------------------------------------
    //just need the path of the file because the elements are already in the project since they are defined in teh pList
    func getArrayString()     //call this function in viewDidLoad
    {
        guard let path = Bundle.main.path(forResource: "ArrayStringPlist", ofType: "plist") else { return }
    
        guard let arrayString = NSArray(contentsOfFile: path) else { return }
        print(arrayString)
    }
    
    
    func getArrayDictionary()
    {
        guard let path = Bundle.main.path(forResource: "ArrayDictPlist", ofType: "plist") else { return }
        
        guard let arrayDictionary = NSArray(contentsOfFile: path) else { return }
        print(arrayDictionary)
        
        //wanna convert this array of dictionaries into a person object
        
        for item in arrayDictionary
        {
            if let value = item as? [String: Any]{
                arrPerson.append(Person(fname: (value["firstName"] as? String)!, lname: (value["lastName"] as? String)!, emailID: (value["email"] as? String)!, ageP: (value["age"] as? String)!))
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


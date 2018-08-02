//
//  ViewController.swift
//  DiaryApplication
//
//  Created by Yash Singh on 7/12/18.
//  Copyright © 2018 Yash Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, diaryDataProtocol{

    @IBOutlet weak var titleTableView: UITableView!
    
    var diaryObjectArray: Array<DiaryModel>?
    
    
    func addData(diaryObject: DiaryModel) {
        if diaryObjectArray == nil
        {
            diaryObjectArray = [DiaryModel]()
        }
//        print("Count is \(diaryObjectArray?.count)")
//        print("Title is " + (diaryObjectArray?[0].title)!)
        
        diaryObjectArray?.append(diaryObject)   //what to add here?
        titleTableView.reloadData()
      self.titleTableView.layoutIfNeeded()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        titleTableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if diaryObjectArray == nil
        {
            return 0
        }
        return (diaryObjectArray?.count)!
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DiaryTableViewCell", for: indexPath) as? DiaryTableViewCell
  
        let object = diaryObjectArray![indexPath.row]
        cell?.diaryNoteTitleLabel?.text = object.title
        cell?.diaryAgeLabel?.text = "\(object.age)"
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let controller = storyboard?.instantiateViewController(withIdentifier: "DiaryDataViewController") as? DiaryDataViewController{
            let obj = diaryObjectArray![indexPath.row]
            controller.diaryInfo = obj
            controller.isNew = false
            
            navigationController?.pushViewController(controller, animated: true)
        }
    }
  
   
   @IBAction func addButtonAction(_ sender: UIButton) {
    if let controller = storyboard?.instantiateViewController(withIdentifier: "DiaryDataViewController") as? DiaryDataViewController{
      
      controller.diaryDelegateVar = self
      
      navigationController?.pushViewController(controller, animated: true)
    }
 
   }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


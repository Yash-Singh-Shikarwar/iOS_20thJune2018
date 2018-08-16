//
//  CountryViewController.swift
//  MVPprojectDemoJuly24
//
//  Created by Yash Singh on 7/24/18.
//  Copyright © 2018 Yash Singh. All rights reserved.
//

import UIKit

class CountryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var countryTableView: UITableView!
    
    var presenterObj: CountryPresenter?
    override func viewDidLoad() {
        
        super.viewDidLoad()
        presenterObj = CountryPresenter(delegate: self)
        presenterObj?.getCountryAPI(completion: { (arrayCountry, error) in
            DispatchQueue.main.async {
               self.countryTableView.reloadData()
            }
        })
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (presenterObj?.getNumberOfRows())!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryTableViewCell") as! CountryTableViewCell
        cell.countryLabel.text = presenterObj?.countryStructArr[indexPath.row].Name
        let urlFlagImg = URL(string: (presenterObj?.countryStructArr[indexPath.row].FlagPng) as! String)
//        do{
//            let dataImg = try Data.init(contentsOf: urlFlagImg!)
//            cell.countryImage.image = UIImage(data: dataImg)
//        }catch{
//            print("Image not getting converted properly to string")
//        }
        cell.countryImage.image = UIImage(data: getImage(urlCountryImage: urlFlagImg!))
        return cell
    }
    
}

extension CountryViewController: CountryProtocol{
    
    func makeCountryAPIServerCall() {
        //presenterObj.getCountryAPI(completion: () -> Void)
    }
//    let urlFlagImg = URL(string: (presenterObj?.countryStructArr[indexPath.row].FlagPng) as! String)
//    do{
//    let dataImg = try Data.init(contentsOf: urlFlagImg!)
//    cell.countryImage.image = UIImage(data: dataImg)
//    }catch{
//    print("Image not getting converted properly to string")
//    }
    
    func getImage(urlCountryImage: URL) -> Data {
        let dummyDataImg: Data = Data.init()
        do{
           let dataImg = try Data.init(contentsOf: urlCountryImage)
            return dataImg
        }catch{
            print("Some problem getting image")
        }
        return dummyDataImg
        
    }
    

    }

//
//  CountryPresenter.swift
//  MVPprojectDemoJuly24
//
//  Created by Yash Singh on 7/24/18.
//  Copyright © 2018 Yash Singh. All rights reserved.
//

import UIKit

class CountryPresenter: NSObject {

    var countryStructArr: Array<Country> = []
    
    //delegate define here
    var countryDelegate: CountryProtocol
    init(delegate: CountryProtocol){
        countryDelegate = delegate
    }
    
    func getCountryAPI(completion: @escaping completionHandlerCountry)
    {
        NetworkLayer.sharedInstance.makeCountryAPIServerCall { (countryArr, error) in
            self.countryStructArr = countryArr
            completion(self.countryStructArr, nil)
            
        }
        
    }
    
    func getNumberOfRows() -> Int
    {
        return countryStructArr.count
    }
    
}

//
//  NetworkLayer.swift
//  MVPprojectDemoJuly24
//
//  Created by Yash Singh on 7/24/18.
//  Copyright © 2018 Yash Singh. All rights reserved.
//

import UIKit

let apiURLCountry: String = "http://countryapi.gear.host/v1/Country/getCountries"
typealias completionHandlerCountry = (Array<Country>, Error?) -> ()
class NetworkLayer{
    
    //private override init(){}
    static let sharedInstance = NetworkLayer()
    func makeCountryAPIServerCall(completionCountry: @escaping completionHandlerCountry) {
        let urlAPICountries = URL(string: apiURLCountry)
        
        URLSession.shared.dataTask(with: urlAPICountries!) { (data, response, error) in
            if error == nil
            {
                print(data)
                //print(response)
                let decoderCountry = JSONDecoder()
                do{
                    let countriesArray = try decoderCountry.decode(JSONDataCountry.self, from: data!)
                    completionCountry(countriesArray.Response, nil)
                }catch{
                    print("An error was caught in the do-catch in NetworkLayer")
                }
                
                
            }
            else{
                completionCountry([], error)
                print("Error is not nil")
            }
            }.resume()
        
    }
  
//    func getCountryFlagImage(urlString: String, completionHandler: @escaping (imageFlag: URL) -> Void){
//        let urlFlagImage = URL(string: urlString)
//        URLSession.shared.downloadTask(with: urlFlagImage!) { (urlFlagImage, response, error) in
//         
//            completionHandler()
//        }
//    }
    
}

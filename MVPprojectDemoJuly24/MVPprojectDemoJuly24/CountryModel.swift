//
//  CountryModel.swift
//  MVPprojectDemoJuly24
//
//  Created by Yash Singh on 7/24/18.
//  Copyright © 2018 Yash Singh. All rights reserved.
//

import UIKit

struct JSONDataCountry: Codable{
    var Response: [Country]    //name of the enclosing dictionary
    
    enum CodingKeys: String, CodingKey{
        case Response
    }
    
    init(from decoderNew: Decoder) throws
    {
        let values = try decoderNew.container(keyedBy: CodingKeys.self)
        Response = try values.decode([Country].self, forKey: .Response)
    }
    
}


struct Country: Codable{
    let Name: String
    let Alpha2Code: String
    let Alpha3Code: String
    let NativeName: String
    let Region: String
    let SubRegion: String
    let Latitude: String
    let Longitude: String
    let Area: String
    let NumericCode: String
    let NativeLanguage: String
    let CurrencyCode: String
    let CurrencyName: String
    let CurrencySymbol: String
    let Flag: String
    let FlagPng: String
    
    enum CodingKeys: String, CodingKey{
        case Name
        case Alpha2Code
        case Alpha3Code
        case NativeName
        case Region
        case SubRegion
        case Latitude
        case Longitude
        case Area
        case NumericCode
        case NativeLanguage
        case CurrencyCode
        case CurrencyName
        case CurrencySymbol
        case Flag
        case FlagPng
    }
    
    init(from decoderNew: Decoder) throws
    {
        let values = try decoderNew.container(keyedBy: CodingKeys.self)
        Name = try values.decode(String.self, forKey: .Name)
        Alpha2Code = try values.decode(String.self, forKey: .Alpha2Code)
        Alpha3Code = try values.decode(String.self, forKey: .Alpha3Code)
        NativeName = try values.decode(String.self, forKey: .NativeName)
        Region = try values.decode(String.self, forKey: .Region)
        SubRegion = try values.decode(String.self, forKey: .SubRegion)
        Latitude = try values.decode(String.self, forKey: .Latitude)
        Longitude = try values.decode(String.self, forKey: .Longitude)
        //  Area = try values.decode(String.self, forKey: .Area) ?? "NA"
        //NumericCode = try values.decode(String.self, forKey: .NumericCode) ?? "NA"
        NativeLanguage = try values.decode(String.self, forKey: .NativeLanguage)
        CurrencyCode = try values.decode(String.self, forKey: .CurrencyCode)
        CurrencyName = try values.decode(String.self, forKey: .CurrencyName)
        CurrencySymbol = try values.decode(String.self, forKey: .CurrencySymbol)
        Flag = try values.decode(String.self, forKey: .Flag)
        FlagPng = try values.decode(String.self, forKey: .FlagPng)
        
        
        //Because some countries have area and numeric codes as NULL so we need to put them in an if let and set a default value to deal with these few things
        if let values = try? values.decode(String.self, forKey: .Area)
        {
            Area = String(values)
        }else
        {
            Area = "Area is Nil"
        }
        if let values = try? values.decode(String.self, forKey: .NumericCode)
        {
            NumericCode = String(values)
        }else{
            NumericCode = "Numeric code is Nil"
        }
        
    }
    
}

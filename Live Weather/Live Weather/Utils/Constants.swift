//
//  Constants.swift
//  Constants
//
//  Created by Nouman Pervez on 01/10/21.
//

import Foundation


struct Constant {
    
    struct Urls {
        
        static func urlForWeatherCity(city: String) -> URL {
            
            let userDefault = UserDefaults.standard
            let unit = (userDefault.value(forKey: "StoredUnits") as? String) ?? "imperial"
            return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city.escaped())&appid=564993aae9ff5124334196c19979be31&units=\(unit)")!
        }
    }
}

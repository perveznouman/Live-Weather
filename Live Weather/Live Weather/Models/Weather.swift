//
//  Weather.swift
//  Weather
//
//  Created by Nouman Pervez on 01/10/21.
//

import Foundation

struct WeatherResponse: Decodable {
    let main: Weather
    let name: String
}

struct Weather: Decodable {
    let temp: Double
    let humidity: Double
}

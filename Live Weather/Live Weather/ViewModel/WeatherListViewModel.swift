//
//  WeatherListViewModel.swift
//  WeatherListViewModel
//
//  Created by Nouman Pervez on 01/10/21.
//

import Foundation


class WeatherListViewModel {
    
    private(set) var weatherViewModels = [WeatherViewModel]()
    
    func addWeatherViewModel (_ weatherViewModel: WeatherViewModel) {
        weatherViewModels.append(weatherViewModel)
    }
    
    func numberOfRows(_ section: Int) -> Int {
        return weatherViewModels.count
    }
    
    func modelAt(_ index: Int) -> WeatherViewModel {
        return weatherViewModels[index]
    }
    
    private func toCelsius() {
      weatherViewModels = weatherViewModels.map { vm in
            let weatherModel = vm
            weatherModel.temperature = (weatherModel.temperature -  32) * 5/9
            return weatherModel
        }
    }
    
    private func toFareheit() {
        weatherViewModels = weatherViewModels.map { vm in
              let weatherModel = vm
              weatherModel.temperature = (weatherModel.temperature * 9/5) + 32
              return weatherModel
          }
    }
    
    func updateUnit(to unit: Unit) {
        switch unit {
        case .celsius:
            toCelsius()
        case .fahrenheit:
            toFareheit()
        }
    }
}

class WeatherViewModel {
    let weatherResponse: WeatherResponse
    var temperature: Int
    
    init(weather: WeatherResponse) {
        weatherResponse = weather
        temperature = Int(weather.main.temp)
    }
    
    var city: String {
        return weatherResponse.name
    }

}

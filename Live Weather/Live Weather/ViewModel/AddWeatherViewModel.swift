//
//  AddWeatherViewModel.swift
//  AddWeatherViewModel
//
//  Created by Nouman Pervez on 01/10/21.
//

import Foundation


class AddWeatherViewModel {
    
    func addWeather(for city: String, completion: @escaping (WeatherViewModel) -> Void) {
        let weatherUrl = Constant.Urls.urlForWeatherCity(city: city)
        let weatherResource = Resource<WeatherResponse>(url: weatherUrl) { data in
            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            return weatherResponse
        }
        WebService().load(resource: weatherResource) { result in
            if let weatherResult = result {
                let vm = WeatherViewModel(weather: weatherResult)
                completion(vm)
            }
        }
    }
}

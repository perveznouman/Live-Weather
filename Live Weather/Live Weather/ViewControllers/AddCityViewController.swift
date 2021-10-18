//
//  AddCityViewController.swift
//  AddCityViewController
//
//  Created by Nouman Pervez on 07/09/21.
//

import UIKit

protocol AddWeatherDelegate {
    func addWeatherDidSave(weatherVm: WeatherViewModel)
}

class AddCityViewController: UIViewController {

    @IBOutlet weak var cityTextField: BindingTextField! 
    
    private var addCityViewModel = AddCityViewModel()
    private var addWeatherVm = AddWeatherViewModel()
    var delegate: AddWeatherDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func closePressed() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func savePressed() {
        guard let cityName = cityTextField.text else {
            return
        }
        addWeatherVm.addWeather(for: cityName) { weatherVm in
            self.delegate.addWeatherDidSave(weatherVm: weatherVm)
            self.dismiss(animated: true, completion: nil)
        }
        
//        let weatherURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=564993aae9ff5124334196c19979be31")!
//        let weatherResource = Resource<WeatherResponse>(url: weatherURL) { data in
//            let response = try? JSONDecoder().decode(WeatherResponse.self, from: data)
//            return response
//        }
//        WebService().load(resource: weatherResource) { result in
//            print(result)
//        }
    }
    
}

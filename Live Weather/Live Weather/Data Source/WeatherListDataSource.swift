//
//  WeatherListDataSource.swift
//  Live Weather
//
//  Created by Nouman Pervez on 22/10/21.
//

import UIKit

class WeatherListDataSource: NSObject, UITableViewDataSource {
    
    var weatherListViewModel: WeatherListViewModel?
    var cellIdentifier: String = "weatherReuseIdentifier"
    
    init(_ weatherListVM: WeatherListViewModel) {
        weatherListViewModel = weatherListVM
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherListViewModel?.weatherViewModels.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! WeatherTableViewCell
        let vm = (weatherListViewModel?.modelAt(indexPath.row))!
        cell.configure(weatherViewModel: vm)
        return cell
    }
    

    
    
}

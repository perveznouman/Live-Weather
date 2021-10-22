//
//  WeatherListDataSource.swift
//  Live Weather
//
//  Created by Nouman Pervez on 22/10/21.
//

import UIKit

class WeatherListDataSource: NSObject, UITableViewDataSource {
    
    var weatherListViewModel: WeatherListViewModel?
    var cellIdentifier: String!
    
    init(_ weatherListVM: WeatherListViewModel) {
        weatherListViewModel = weatherListVM
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let _ = weatherListViewModel?.modelAt(indexPath.row)
        return cell
    }
    

    
    
}

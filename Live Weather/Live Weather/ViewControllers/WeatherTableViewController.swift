//
//  WeatherTableViewController.swift
//  WeatherTableViewController
//
//  Created by Nouman Pervez on 07/09/21.
//

import UIKit

class WeatherTableViewController: UITableViewController {

    private var weatherListVm = WeatherListViewModel()
    private var lastSelectedUnit: Unit!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let userDefault = UserDefaults.standard
        let unit = (userDefault.value(forKey: "StoredUnits") as? String) ?? "imperial"
        lastSelectedUnit = Unit(rawValue: unit)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "addWeatherViewController") {
            prepareSegueForAddWeatherCity(segue: segue)
        } else {
            prepareSegueForSettings(segue: segue)
        }
    }
    
    private func prepareSegueForAddWeatherCity(segue: UIStoryboardSegue) {
        guard let nav = segue.destination as? UINavigationController else {
            fatalError("Navigation error")
        }
        guard let addWeatherVC = nav.viewControllers.first as? AddCityViewController else {
            fatalError("viewcontroller error")
        }
        addWeatherVC.delegate = self
    }

    private func prepareSegueForSettings(segue: UIStoryboardSegue) {
        guard let nav = segue.destination as? UINavigationController else {
            fatalError("Navigation error")
        }
        guard let settingsVC = nav.viewControllers.first as? SettingsTableViewController else {
            fatalError("viewcontroller error")
        }
        settingsVC.delegate = self
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherListVm.numberOfRows(section)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherReuseIdentifier", for: indexPath) as? WeatherTableViewCell
        let viewModel = weatherListVm.modelAt(indexPath.row)
        cell?.configure(weatherViewModel: viewModel)
        return cell!
    }

}

extension WeatherTableViewController: AddWeatherDelegate {
    
    func addWeatherDidSave(weatherVm: WeatherViewModel) {
        weatherListVm.addWeatherViewModel(weatherVm)
        tableView.reloadData()
    }
}

extension WeatherTableViewController: SettingsDelegate {
    func settingsUpdate(vm: SettingsViewModel) {
        if lastSelectedUnit != vm.selectedUnit {
            weatherListVm.updateUnit(to: vm.selectedUnit!)
            tableView.reloadData()
            lastSelectedUnit = Unit(rawValue: vm.selectedUnit!.rawValue)
        }
    }
}

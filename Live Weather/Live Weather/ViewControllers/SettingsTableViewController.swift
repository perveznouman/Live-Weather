//
//  SettingsTableViewController.swift
//  SettingsTableViewController
//
//  Created by Nouman Pervez on 05/10/21.
//

import UIKit

protocol SettingsDelegate {
    func settingsUpdate(vm: SettingsViewModel)
}

class SettingsTableViewController: UITableViewController {

    private var settingsVm = SettingsViewModel()
    var delegate: SettingsDelegate?
    //SettingsId
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

    @IBAction func donePressed() {
        delegate?.settingsUpdate(vm: settingsVm)
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Table view data source

   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsVm.units.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let vm = settingsVm.units[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCellId", for: indexPath)
        cell.textLabel?.text = vm.displayName
        if let _ = settingsVm.selectedUnit {
            if vm ==  settingsVm.selectedUnit {
                cell.accessoryType = .checkmark
            }
            else {
                cell.accessoryType = .none
            }
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.visibleCells.forEach { cell in
            cell.accessoryType = .none
        }
        if let selectedCell = tableView.cellForRow(at: indexPath) {
            selectedCell.accessoryType = .checkmark
            let selectedUnit = Unit.allCases[indexPath.row]
            settingsVm.selectedUnit = selectedUnit
        }
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let selectedCell = tableView.cellForRow(at: indexPath) {
            selectedCell.accessoryType = .none
        }
    }

}

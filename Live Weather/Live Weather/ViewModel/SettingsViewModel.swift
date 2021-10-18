//
//  SettingsViewModel.swift
//  SettingsViewModel
//
//  Created by Nouman Pervez on 05/10/21.
//

import Foundation

enum Unit: String, CaseIterable {
    
    case celsius = "metric"
    case fahrenheit = "imperial"
}

extension Unit {
    
    var displayName: String {
        
        get {
            switch(self) {
            case .celsius:
                return "Celsius"
            case .fahrenheit:
                return "Fahrenheit"
            }
        }
    }
}

struct SettingsViewModel {
    
    let units = Unit.allCases
    var selectedUnit: Unit? {
        get {
            let userDefault = UserDefaults.standard
            var unitVal = ""
            if let value = userDefault.value(forKey: "StoredUnits") as? String {
                unitVal = value
            }
            return Unit(rawValue: unitVal) ?? Unit(rawValue: "imperial")
        }
        set {
            let userDefault = UserDefaults.standard
            userDefault.set(newValue?.rawValue, forKey: "StoredUnits")
        }
    }
}

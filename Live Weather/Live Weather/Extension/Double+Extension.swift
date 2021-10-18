//
//  Double+Extension.swift
//  Double+Extension
//
//  Created by Nouman Pervez on 05/10/21.
//

import Foundation

extension Double {
    func formatAsDegree() -> String {
        return String(format: "%.0f°", self)
    }
}


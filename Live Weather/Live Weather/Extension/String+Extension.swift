//
//  String+Extension.swift
//  String+Extension
//
//  Created by Nouman Pervez on 01/10/21.
//

import Foundation

extension String {
    
    func escaped() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
}

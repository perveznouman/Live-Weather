//
//  BindingTextField.swift
//  Live Weather
//
//  Created by Nouman Pervez on 18/10/21.
//

import UIKit

class BindingTextField: UITextField {

    typealias textChangeClosureType = (String) -> ()
    var textChangeClosure: textChangeClosureType = { _ in }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func bind (callBack: @escaping textChangeClosureType ) {
        self.textChangeClosure = callBack
    }
    
    private func commonInit() {
        self.addTarget(self, action: #selector(editingChanged(_:)), for: .editingChanged)
    }
    
    @objc private func editingChanged(_ textField: UITextField) {
        if let text = self.text {
            self.textChangeClosure(text)
        }
    }
}

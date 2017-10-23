//
//  BindingTextBox.swift
//  Headlines
//
//  Created by Mohammad Azam on 10/20/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import Foundation
import UIKit

class BindingTextField : UITextField {
    
    var textChanged :(String) -> () = { _ in }
    
    func bind(callback :@escaping (String) -> ()) {
        
        self.textChanged = callback
        self.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField :UITextField) {
        
        self.textChanged(textField.text!)
    }
    
}

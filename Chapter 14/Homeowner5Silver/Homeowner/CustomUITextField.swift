//
//  CustomUITextField.swift
//  Homeowner5
//
//  Created by John Le on 7/12/17.
//  Copyright © 2017 John Le. All rights reserved.
//

import UIKit

class CustomUITextField: UITextField {
    override func becomeFirstResponder() -> Bool {
        super.becomeFirstResponder()
        
        borderStyle = .bezel
        
        return true
    }
    
    override func resignFirstResponder() -> Bool {
        super.resignFirstResponder()
        
        borderStyle = .roundedRect
        
        return true
    }
}

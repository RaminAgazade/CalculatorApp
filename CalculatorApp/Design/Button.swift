//
//  Button.swift
//  CalculatorApp
//
//  Created by Ramin on 03.10.23.
//

import UIKit

public class Button: UIButton, StringValue {
    
    public var string: String {
        guard let text = titleLabel?.text else {
            return ""
        }
        return text
        
    }
}

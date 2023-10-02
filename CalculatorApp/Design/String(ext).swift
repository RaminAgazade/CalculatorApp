//
//  String(ext).swift
//  CalculatorApp
//
//  Created by Ramin on 03.10.23.
//

import Foundation

extension String: DoubleValue {
      public var double: Double {
        guard let number =  Double(self) else { return 0.0 }
        return number
    }
   
}


//
//  CalculatorViewModel.swift
//  CalculatorApp
//
//  Created by Ramin on 03.10.23.
//

import Foundation

public class CalculatorViewModel: CalculatorViewControllerDelegate {
   
    public var number1: String = ""
    public var number2: String = ""
    public var result: String = ""
    public var operation: Operation = .none
    
    
    public func click(number: String) -> String {
        if operation == .none {
            number1.append(number)
            return number1
        } else {
            number2.append(number)
            return number2
        }
        
    }
    
    
    public func allClear() {
        number1 = ""
        number2 = ""
        operation = .none
        
    }
    
    
    public func clickPlusMinus() -> String {
        if let index = number1.firstIndex(of: "-") {
        number1.remove(at: index)
            return number1
            }
        number1.insert("-", at: number1.startIndex)
        return number1
    }
    
    public func clickDot() -> String {
              if let _ = number1.firstIndex(of: ".") {
                return number1
               }
                number1.append(".")
                return number1
    }
    
    public func click(operation: Operation) -> String {
               switch operation {
                case .equal:
                makeOperation()
                    return result
                case .per:
                    if self.operation != .none {
                        result = "\(result.double / 100)"
                        return result
                    } else {
                        result = "\(number1.double / 100)"
                        return result
                    }
               case .sqrt:
                   if self.operation != .none {
                       result = "\(√(result.double))"
                       return result
                   } else {
                       result = "\(√(number1.double))"
                       return result
                   }
                   
                   case _:
                    break
                }
        
                self.operation = operation
                return number1
    }
    
    
    private func makeOperation() {
        switch operation {
        case .add:
            result = "\(number1.double + number2.double)"
        case .equal:
          break
        case .sub:
            result = "\(number1.double - number2.double)"
        case .mult:
            result = "\(number1.double * number2.double)"
        case .div:
            result = "\(number1.double / number2.double)"
        case _:
            break

        }
        
        
    }
    
}

prefix operator √
prefix func √ (lhs: Double) -> Double {
    sqrt(lhs)
}


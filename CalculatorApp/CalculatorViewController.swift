//
//  CalculatorViewController.swift
//  CalculatorApp
//
//  Created by Ramin on 03.10.23.
//

import UIKit

public protocol CalculatorViewControllerDelegate {
    func click(number: String) -> String
    func allClear()
    func clickPlusMinus() -> String
    func clickDot() -> String
    func click(operation: Operation) -> String
}

public class CalculatorViewController: ViewController {
@IBOutlet weak var label: Label!
    
public var delegate: CalculatorViewControllerDelegate?
    public init(delegate: CalculatorViewControllerDelegate? = nil) {
        self.delegate = delegate
       super.init(nibName: nil, bundle: nil)
    }
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    @IBAction func clickNumber(_ sender: Button) {
        label.text = delegate?.click(number: sender.string)
    }
    
    @IBAction func allClear(_ sender: Button) {
        delegate?.allClear()
        label.text = "0"
    }
    
    @IBAction func clickPlusMinus(_ sender: Button) {
        label.text = delegate?.clickPlusMinus()
    }
    
    @IBAction func clickDot(_ sender: Button) {
        label.text = delegate?.clickDot()
    }
    
    
    @IBAction func clickOperations(_ sender: Button) {
        
        guard let operation = Operation(rawValue: sender.string) else {
            return
            
        }

        label.text = delegate?.click(operation: operation)
    }

}

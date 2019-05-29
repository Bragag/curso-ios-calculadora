//
//  ViewController.swift
//  Calculadora
//
//  Created by Leonardo Braga on 26/05/19.
//  Copyright © 2019 CWI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var operations = Operations()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var firstNumberText = "0"
    var secondNumberText = ""
    var op = ""
    var isFirstNumber = true
    var hasOp = false
    var canClear = true
    
    @IBAction func onPressButton(_ sender: DesignableButton) {
        
        let currentText = resultLabel.text!
        let textLabel = sender.titleLabel?.text
        
        if let text = textLabel {
            switch text {
            case "AC" :
                firstNumberText = "0"
                secondNumberText = ""
                op = ""
                isFirstNumber = true
                hasOp = false
                canClear = true
                resultLabel.text = "0"
                break
            case "+", "×", "÷" :
                if hasOp {
                    return
                }
                if firstNumberText == "- " {
                    return
                }
                if firstNumberText == "0" {
                    resultLabel.text = "0"
                    return
                }
                op = text
                isFirstNumber = false
                hasOp = true
                resultLabel.text = "\(currentText) \(op) "
                break
            case "√x", "x²":
                if hasOp {
                    return
                }
                if firstNumberText == "0" {
                    resultLabel.text = "0"
                    return
                }
                op = text
                isFirstNumber = true
                hasOp = false
                canClear = true
                let result = calculate()
                firstNumberText = "\(result)"
                resultLabel.text = "\(result)"
                break
            case "-":
                if hasOp {
                    return
                }
                op = text
                if firstNumberText == "0" {
                    resultLabel.text = "\(op) "
                    firstNumberText = "\(op) "
                    hasOp = false
                    isFirstNumber = true
                } else {
                    resultLabel.text = "\(currentText) \(op) "
                    isFirstNumber = false
                    hasOp = true
                }
            case "=":
                if secondNumberText == "" {
                    resultLabel.text = firstNumberText
                    return
                }
                isFirstNumber = true
                hasOp = false
                canClear = true
                let result = calculate()
                firstNumberText = "\(result)"
                resultLabel.text = "\(result)"
                break
            default:
                if isFirstNumber {
                    if firstNumberText == "0" {
                        firstNumberText = "\(text)"
                        resultLabel.text = "\(text)"
                        return
                    } else if firstNumberText == "- " {
                        firstNumberText = "-\(text)"
                    } else {
                        firstNumberText = "\(firstNumberText)\(text)"
                    }
                } else {
                    secondNumberText = "\(secondNumberText)\(text)"
                }
                
                resultLabel.text = "\(currentText)\(text)"
                break
            }
        }
    }
    
    func calculate() -> Double {
        let firstNumber = Double(firstNumberText)!
        var secondNumber = 0.1
        if !["√x", "x²"].contains(op) {
            secondNumber  = Double(secondNumberText)!
        }
        
        firstNumberText = "0"
        secondNumberText = ""
        
        switch op {
        case "+":
            return operations.sum(firstArg: firstNumber, secondArg: secondNumber)
        case "-":
            return operations.minus(firstArg: firstNumber, secondArg: secondNumber)
        case "×":
            return operations.multiply(firstArg: firstNumber, secondArg: secondNumber)
        case "÷":
            return operations.divide(firstArg: firstNumber, secondArg: secondNumber)
        case "√x":
            return firstNumber.squareRoot()
        case "x²":
            return pow(firstNumber, 2)
        default:
            return 0
        }
    }
}


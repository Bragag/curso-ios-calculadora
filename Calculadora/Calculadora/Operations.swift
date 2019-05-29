//
//  Operations.swift
//  Calculadora
//
//  Created by Leonardo Braga on 28/05/19.
//  Copyright © 2019 CWI. All rights reserved.
//

import Foundation

class Operations {
    
    func sum(firstArg firstNumber: Double, secondArg secondNumber: Double) -> Double{
        return firstNumber + secondNumber
    }
    
    func minus(firstArg firstNumber: Double, secondArg secondNumber: Double) -> Double{
        return firstNumber - secondNumber
    }
    
    func multiply(firstArg firstNumber: Double, secondArg secondNumber: Double) -> Double{
        return firstNumber * secondNumber
    }
    
    func divide(firstArg firstNumber: Double, secondArg secondNumber: Double) -> Double{
        return firstNumber / secondNumber
    }
    
    func convertToInt(val:Double)->Int?{
        let rounded = val.rounded()
        return rounded == val ? Int(rounded) : nil
    }
}

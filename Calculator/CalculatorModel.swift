//
//  CalculatorModel.swift
//  CalculatorModel
//
//  Created by dev on 2021/12/28.
//

import Foundation

struct CalculatorModel {
    private(set) var resultValue: Decimal = 0
    private var operation: CalculatorOperation?
    private var operand: Decimal?
    
    mutating func reset() {
        resultValue = 0
        operation = nil
        operand = nil
    }
    
    mutating func updateOperand(operand: Decimal) {
        if resultValue == 0 {
            resultValue = operand
        } else {
            self.operand = operand
        }
    }
    
    mutating func updateOperation(_ operation: CalculatorOperation) {
        self.operation = operation
    }
    
    mutating func doCalculate(_ operand: Decimal) {
        self.operand = operand
        switch operation {
        case .add:
            resultValue += operand
        case .subtract:
            resultValue -= operand
        case .multiply:
            resultValue *= operand
        case .divide:
            resultValue /= operand
        case .none:
            break
        }
    }
}

enum CalculatorOperation {
    case add
    case subtract
    case multiply
    case divide
}

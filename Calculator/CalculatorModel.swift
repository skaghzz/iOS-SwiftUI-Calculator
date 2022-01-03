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
    private var operand: Double?
    
    mutating func reset() {
        resultValue = 0
        operation = nil
        operand = nil
    }
    
    mutating func updateOperand(operand: Double) {
        if resultValue == 0 {
            resultValue = Decimal.init(operand)
        } else {
            self.operand = operand
        }
    }
    
    mutating func updateOperation(_ operation: CalculatorOperation) {
        self.operation = operation
    }
    
    mutating func doCalculate(_ operand: Double) {
        self.operand = operand
        switch operation {
        case .add:
            resultValue += Decimal(operand)
        case .subtract:
            resultValue -= Decimal(operand)
        case .multiply:
            resultValue *= Decimal(operand)
        case .divide:
            resultValue /= Decimal(operand)
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

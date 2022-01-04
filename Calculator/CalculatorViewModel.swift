//
//  CalculatorViewModel.swift
//  Calculator
//
//  Created by dev on 2021/12/28.
//

import Foundation
import SwiftUI

class CalculatorViewModel: ObservableObject {
    @Published private var calculatorModel = CalculatorModel()
    @Published var makingValue: String?
    
    var runningValue: Decimal {
        if let makingValue = makingValue {
            do {
                return try Decimal(makingValue, format: .number)
            } catch {
                return Decimal(0)
            }
        } else {
            return Decimal(0)
        }
        
    }
    
    private func formatForDisplay(_ number: Decimal) -> String {
        return number.description
    }
    
    func displayValue() -> String {
        if let makingValue = makingValue {
            return makingValue
        } else {
            return formatForDisplay(calculatorModel.resultValue)
        }
    }
    
    func appendNumber(_ number: String) {
        makingValue = "\(makingValue ?? "")\(number)"
    }
    
    func allClear() {
        makingValue = nil
        calculatorModel.reset()
    }
    
    func negative() {
        
        makingValue = String((-runningValue).description)
    }
    
    func percent() {
        makingValue = String((runningValue * 0.01).description)
    }
    
    func operate(_ op: CalculatorOperation) {
        calculatorModel.updateOperand(operand: runningValue)
        calculatorModel.updateOperation(op)
        makingValue = nil
    }
    
    func eqaul() {
        calculatorModel.doCalculate(runningValue)
        makingValue = nil
    }
}


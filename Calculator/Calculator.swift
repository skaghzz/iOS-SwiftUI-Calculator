//
//  Calculator.swift
//  Calculator
//
//  Created by dev on 2021/12/28.
//

struct Calculator {
    private(set) var result: Double
    
    init() {
        result = 0
    }
    
    mutating func allClear() {
        result = 0
    }
    
    mutating func plus(operand: Double) {
        result += operand
    }
    
    mutating func minus(operand: Double) {
        result -= operand
    }
    
    mutating func multiply(operand: Double) {
        result *= operand
    }
    
    mutating func divide(operand: Double) {
        result /= operand
    }
    
    mutating func percentile() {
        result = result * 0.01
    }
    
    mutating func switchSign() {
        result = -result
    }
}

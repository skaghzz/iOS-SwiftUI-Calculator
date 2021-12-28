//
//  MyCalculator.swift
//  Calculator
//
//  Created by dev on 2021/12/28.
//

import Foundation

class MyCalculator: ObservableObject {
    @Published private var calculator = createCalculator()
    
    private static func createCalculator() -> Calculator {
        Calculator()
    }
}

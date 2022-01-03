//
//  CalculatorApp.swift
//  Calculator
//
//  Created by dev on 2021/12/28.
//

import SwiftUI

@main
struct CalculatorApp: App {
    let calculator = CalculatorViewModel()
    var body: some Scene {
        WindowGroup {
            CalculatorView(calculatorViewModel: calculator)
        }
    }
}

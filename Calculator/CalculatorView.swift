//
//  CalculatorView.swift
//  Calculator
//
//  Created by dev on 2021/12/31.
//

import SwiftUI

struct CalculatorView: View {
    @ObservedObject var calculatorViewModel: CalculatorViewModel
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Text(calculatorViewModel.displayValue())
                        .font(.system(size: 64))
                        .foregroundColor(.white)
                }
                .padding()
                
                ForEach(buttons, id:\.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id:\.self) { item in
                            Button(action: {
                                buttonTap(item: item)
                            }, label: {
                                Text(item.rawValue)
                                    .font(.system(size: 32))
                                    .frame(width: buttonWidth(time: item),
                                           height: buttonHeight())
                                    .background(item.buttonColor)
                                    .foregroundColor(.white)
                                    .cornerRadius(buttonWidth(time: item)/2)
                            })
                        }
                    }
                    .padding(.bottom, 3)
                }
            }
            
        }
    }
    
    private func buttonTap(item: CalcButton) {
        switch item {
        case .clear:
            calculatorViewModel.allClear()
        case .negative:
            calculatorViewModel.negative()
        case .percent:
            calculatorViewModel.percent()
        case .divide:
            calculatorViewModel.operate(.divide)
        case .multipy:
            calculatorViewModel.operate(.multiply)
        case .subtract:
            calculatorViewModel.operate(.subtract)
        case .add:
            calculatorViewModel.operate(.add)
        case .equal:
            calculatorViewModel.eqaul()
        case .decimal:
            break
        default:
            calculatorViewModel.appendNumber(item.rawValue)
        }
    }
    
    private func buttonWidth(time: CalcButton) -> CGFloat {
        if time == .zero {
            return ((UIScreen.main.bounds.width - (4*12)) / 4) * 2
        }
        return (UIScreen.main.bounds.width - (5*12)) / 4
    }
    
    private func buttonHeight() -> CGFloat {
        return (UIScreen.main.bounds.width - (5*12)) / 4
    }
    
    private let buttons: [[CalcButton]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multipy],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal],
    ]
}

enum CalcButton: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case add = "+"
    case subtract = "-"
    case divide = "/"
    case multipy = "X"
    case equal = "="
    case clear = "AC"
    case decimal = "."
    case percent = "%"
    case negative = "+/-"
    
    var buttonColor: Color {
        switch self {
        case .add, .subtract, .multipy, .divide, .equal:
            return .orange
        case .clear, .negative, .percent:
            return Color(uiColor: .lightGray)
        default:
            return Color(UIColor(red: 55/255.0, green: 55/255.0, blue: 55/255.0, alpha: 1))
        }
    }
}

struct CalculatorMain_Previews: PreviewProvider {
    static var previews: some View {
        let calculator = CalculatorViewModel()
        CalculatorView(calculatorViewModel: calculator)
    }
}

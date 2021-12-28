//
//  SwiftUIView.swift
//  Calculator
//
//  Created by dev on 2021/12/28.
//

import SwiftUI

struct CalculatorButton: View {
    var text: String
    
    var body: some View {
        Button(action: {
            print("aaaaaa")
        }) {
            ZStack {
                Circle()
                    .fill(.gray)
                Text(text)
                    .foregroundColor(.black)
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorButton(text: "AC")
    }
}

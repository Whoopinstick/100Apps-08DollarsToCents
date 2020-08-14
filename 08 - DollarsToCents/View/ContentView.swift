//
//  ContentView.swift
//  08 - DollarsToCents
//
//  Created by Kevin Paul on 8/13/20.
//  Copyright © 2020 Whoopinstick. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var dollarText = ""
    
    var dollarAmount: Double {
        return Double(dollarText) ?? 0.0
    }
    
    var dollarAmountInt: Int {
        return Int(dollarAmount * 100)
    }
    
    var quarter: Int {
        return dollarAmountInt / 25
    }
    
    var dime: Int {
        return (dollarAmountInt - (quarter * 25)) / 10
    }
    
    var nickel: Int {
        return (dollarAmountInt - (quarter * 25) - (dime * 10)) / 5
    }
    
    var penny: Int {
        return (dollarAmountInt - (quarter * 25) - (dime * 10) - (nickel * 5)) / 1
    }
    
    
    var body: some View {
        Form {
            Section(header: Text("Enter an amount:")) {
                TextField("0.00", text: $dollarText)
                    .keyboardType(.decimalPad)
            }
            
            Section(header: Text("Amount as change:")) {
                Text("Quarters: \(quarter)")
                Text("Dimes: \(dime)")
                Text("Nickels: \(nickel)")
                Text("Pennies: \(penny)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

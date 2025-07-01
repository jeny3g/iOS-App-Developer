//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Jean Oliveira Miranda on 01/07/25.
//  Copyright © 2025 The App Brewery. All rights reserved.
//

import Foundation

struct BillCalculator {
    private var currentBill: Bill
    
    init(totalAmount: Float = 0, tipPercentage: Float = 0.1, splitBetween: Int = 2) {
        self.currentBill = Bill(
            totalAmount: totalAmount,
            tipPercentage: tipPercentage,
            splitBetween: splitBetween
        )
    }
    
    mutating func updateTotalAmount(_ amount: Float) {
        currentBill.totalAmount = amount
    }
    
    mutating func updateTipPercentage(from percentageString: String) {
        if let decimalValue = BillCalculator.parsePercentage(percentageString) {
            currentBill.tipPercentage = decimalValue
        }
    }
    
    mutating func updateSplitBetween(_ people: Int) {
        currentBill.splitBetween = people
    }
    
    func getAmountPerPerson() -> Float {
        return currentBill.amountPerPerson
    }
    
    func getBillDetails() -> Bill {
        return currentBill
    }
    
    // Helper estático para reutilização
    private static func parsePercentage(_ percentageString: String) -> Float? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        return formatter.number(from: percentageString)?.floatValue
    }
}

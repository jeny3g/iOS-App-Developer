//
//  Bill.swift
//  Tipsy
//
//  Created by Jean Oliveira Miranda on 01/07/25.
//  Copyright © 2025 The App Brewery. All rights reserved.
//


struct Bill {
    var totalAmount: Float
    var tipPercentage: Float
    var splitBetween: Int
    
    var totalWithTip: Float {
        return totalAmount * (1 + tipPercentage)
    }
    
    var amountPerPerson: Float {
        return totalWithTip / Float(splitBetween)
    }
}

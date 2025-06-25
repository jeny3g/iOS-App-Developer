//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Jean Oliveira Miranda on 25/06/25.
//  Copyright © 2025 The App Brewery. All rights reserved.
//

struct Question {
    let text: String
    let asnwer: String
    
    init(q: String, a: String) {
        self.text = q
        self.asnwer = a
    }
}

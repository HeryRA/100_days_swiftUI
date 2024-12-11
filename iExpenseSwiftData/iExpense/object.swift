//
//  object.swift
//  iExpense
//
//  Created by RATSIMANOSIKA HERY on 25/10/2024.
//

import Foundation
import SwiftData

@Model
class ExpenseItem {
    var name: String
    var type: String
    var price: Int
    
    init(name: String, type: String, price: Int) {
        self.name = name
        self.type = type
        self.price = price
    }
}

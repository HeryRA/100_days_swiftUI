//
//  object.swift
//  iExpense
//
//  Created by RATSIMANOSIKA HERY on 25/10/2024.
//

import Foundation
import Observation

struct ExpenseItem: Hashable, Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let price: Int
}

@Observable
class Expenses {
    var businessItems = [ExpenseItem](){
        didSet{
            if let data = try? JSONEncoder().encode(businessItems){
                UserDefaults.standard.set(data, forKey: "businessItems")
            }
        }
    }
    
    var personalItems = [ExpenseItem](){
        didSet{
            if let data = try? JSONEncoder().encode(personalItems){
                UserDefaults.standard.set(data, forKey: "personalItems")
            }
        }
    }
    
    init() {
        if let businessData = UserDefaults.standard.data(forKey: "businessItems"),
           let businessDecoded = try? JSONDecoder().decode([ExpenseItem].self, from: businessData) {
            businessItems = businessDecoded
        }
        if let personnalData = UserDefaults.standard.data(forKey: "personalItems"),
           let personnalDecoded = try? JSONDecoder().decode([ExpenseItem].self, from: personnalData) {
            personalItems = personnalDecoded
            return
        }
        businessItems = []
        personalItems = []
    }
    
    func removeBusinessItem(at offset: IndexSet){
        businessItems.remove(atOffsets: offset)
    }
    
    func removePersonalItem(at offset: IndexSet){
        personalItems.remove(atOffsets: offset)
    }
}

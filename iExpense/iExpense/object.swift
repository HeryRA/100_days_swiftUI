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
        }else {
            businessItems = []
        }
        
        if let personnalData = UserDefaults.standard.data(forKey: "personalItems"),
           let personnalDecoded = try? JSONDecoder().decode([ExpenseItem].self, from: personnalData) {
            personalItems = personnalDecoded
        }else {
            personalItems = []
        }
    }
    
    func removeBusinessItem(at offsets: IndexSet){
        businessItems.remove(atOffsets: offsets)
    }
    
    func removePersonalItem(at offsets: IndexSet){
        personalItems.remove(atOffsets: offsets)
    }
}

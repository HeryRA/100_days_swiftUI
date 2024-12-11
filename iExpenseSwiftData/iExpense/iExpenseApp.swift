//
//  iExpenseApp.swift
//  iExpense
//
//  Created by RATSIMANOSIKA HERY on 23/10/2024.
//
import SwiftData
import SwiftUI

@main
struct iExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ExpenseItem.self)
    }
}

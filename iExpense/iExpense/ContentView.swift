//
//  ContentView.swift
//  iExpense
//
//  Created by RATSIMANOSIKA HERY on 23/10/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var expenses = Expenses()
    
    var body: some View {
        NavigationStack {
            List {
                if expenses.businessItems.count > 0{
                    SectionExpenses(section: "Business expenses", list: expenses.businessItems, onDel: expenses.removeBusinessItem)
                }
                if expenses.personalItems.count > 0{
                    SectionExpenses(section: "Personnal expenses", list: expenses.personalItems, onDel: expenses.removePersonalItem)
                }
            }
            .listStyle(.plain)
            .navigationTitle("iExpense")
            .toolbar {
                Menu {
                    NavigationLink("Business Item") {
                        addView(expense: $expenses.businessItems, type: "business")
                    }
                    NavigationLink("Personnal Item") {
                        addView(expense: $expenses.personalItems, type: "personnal")
                    }
                } label: {
                    Button("Add expense", systemImage: "plus"){}
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

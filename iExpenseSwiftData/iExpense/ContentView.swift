//
//  ContentView.swift
//  iExpense
//
//  Created by RATSIMANOSIKA HERY on 23/10/2024.
//
import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @State private var showAddView: Bool = false
    @State private var filter = ""
    @State private var sortOrder = [SortDescriptor<ExpenseItem>(\.name)]
    
    var body: some View {
        NavigationStack {
            List {
                expensesView(for: filter, by: sortOrder)
            }
            .searchable(text: $filter)
            .navigationTitle("iExpense")
            .toolbar {
                Menu {
                    Picker("Sort", selection: $sortOrder) {
                        Text("Name").tag([
                            SortDescriptor(\ExpenseItem.name),
                            SortDescriptor<ExpenseItem>(\.price, order: .reverse)
                        ])
                        Text("Amount").tag([
                            SortDescriptor<ExpenseItem>(\.price, order: .reverse),
                            SortDescriptor(\ExpenseItem.name)
                        ])
                    }
                } label: {
                    Button("Sort", systemImage: "arrow.up.arrow.down"){}
                }
                
                Menu {
                    Picker("Filter", selection: $filter) {
                        Text("All").tag("")
                        Text("Business").tag("business")
                        Text("Personal").tag("personal")
                    }
                } label: {
                    Button("Filter", systemImage: "line.3.horizontal.decrease"){}
                }

                Button("Add expense", systemImage: "plus"){
                    showAddView.toggle()
                }
            }
            .sheet(isPresented: $showAddView, content: { addView() })
        }
    }
}

#Preview {
    ContentView()
}

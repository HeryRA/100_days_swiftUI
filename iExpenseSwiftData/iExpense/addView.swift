//
//  addView.swift
//  iExpense
//
//  Created by RATSIMANOSIKA HERY on 25/10/2024.
//

import SwiftUI

struct addView: View {
    @Environment(\.modelContext) var modelContext
    let types = ["business", "personal"]
    @State private var name = ""
    @State private var type = ""
    @State private var price = 0
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Form{
                TextField("expense name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) { type in
                        Text(type)
                    }
                }
                TextField("Price", value: $price, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add \(type) expense")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        let newExpense = ExpenseItem(name: name, type: type, price: price)
                        modelContext.insert(newExpense)
                        dismiss()
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    addView()
}

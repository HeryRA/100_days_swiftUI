//
//  ListExpenses.swift
//  iExpense
//
//  Created by RATSIMANOSIKA HERY on 25/10/2024.
//

import SwiftUI

struct SectionExpenses: View {
    let section: String
    let list: [ExpenseItem]
    var total: Int{
        list.reduce(0){ $0 + $1.price }
    }
    let onDel: (IndexSet) -> Void
    let currency = Locale.current.currency?.identifier ?? "USD"
    
    var body: some View {
        Section("\(section) : \(total.formatted(.currency(code: currency)))") {
            ForEach(list) { item in
                HStack{
                    VStack(alignment: .leading){
                        Text(item.name)
                            .font(.headline)
                        Text(item.type)
                            .font(.subheadline)
                    }
                    Spacer()
                    Text(String(item.price.formatted(.currency(code: currency))))
                        .foregroundColor(item.price > 5000000 ? .red : item.price > 1000000 ? .orange : .green)
                }
            }
            .onDelete(perform: onDel)
        }
    }
}


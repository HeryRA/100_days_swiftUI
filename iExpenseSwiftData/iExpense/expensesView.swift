//
//  ListExpenses.swift
//  iExpense
//
//  Created by RATSIMANOSIKA HERY on 25/10/2024.
//
import SwiftData
import SwiftUI

struct expensesView: View {
    @Query var list: [ExpenseItem]
    @Environment(\.modelContext) var modelContext
    var total: Int{
        list.reduce(0){ $0 + $1.price }
    }
    let currency = Locale.current.currency?.identifier ?? "USD"
    
    var body: some View {
        Section("Total : \(total.formatted(.currency(code: currency)))") {
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
            .onDelete(perform: removeItem)
        }
    }
    
    init(for filter: String, by sortOrder: [SortDescriptor<ExpenseItem>]) {
        if !filter.isEmpty {
            _list = Query(filter: #Predicate<ExpenseItem>{ item in
                item.type == filter || item.name.localizedStandardContains(filter)
            }, sort: [SortDescriptor<ExpenseItem>(\.type)] + sortOrder)
        }else {
            _list = Query(sort: [SortDescriptor<ExpenseItem>(\.type)] + sortOrder)
        }
    }
    
    func removeItem(offsets: IndexSet) {
        for offset in offsets {
            let item = list[offset]
            modelContext.delete(item)
        }
    }
}


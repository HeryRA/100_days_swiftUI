//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by RATSIMANOSIKA HERY on 20/11/2024.
//

import SwiftUI

struct AddressView: View {
    @Bindable var order: Order
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.name)
                TextField("Street Address", text: $order.streetAddress)
                TextField("City", text: $order.city)
                TextField("Zip Code", text: $order.zipCode)
            }
            Section {
                NavigationLink("Check out") {
                    CheckOutView(order: order)
                }
                .disabled(!order.hasValidAddress)
            }
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    AddressView(order: Order())
}

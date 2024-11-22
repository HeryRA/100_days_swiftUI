//
//  CheckOutView.swift
//  CupcakeCorner
//
//  Created by RATSIMANOSIKA HERY on 20/11/2024.
//

import SwiftUI

struct CheckOutView: View {
    var order: Order
    @State private var showAlert = false
    @State private var confirmationTitle = ""
    @State private var confirmationMessage = ""
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233)
                Text("Your total is \(order.cost, format: .currency(code: Order.currency))")
                Button {
                    Task {
                        await placeOrder()
                    }
                } label: {
                    Text("Place order")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
            }
        }
        .navigationTitle("Check out")
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
        .alert(confirmationTitle, isPresented: $showAlert, actions: {}) {
            Text(confirmationMessage)
        }
    }
    
    func placeOrder() async {
        guard let encoded = try? JSONEncoder().encode(order) else { return }
        let url = URL(string: "https://reqres.in/api/cupcakeCorner")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do{
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            let decoded = try JSONDecoder().decode(Order.self, from: data)
            confirmationTitle = "Thank you!"
            confirmationMessage = "Your order for \(decoded.quantity) \(Order.types[decoded.type].lowercased()) cupcakes is on its way"
            showAlert = true
        }catch {
            confirmationTitle = "Oops!"
            confirmationMessage = "Something went wrong. Please try again later."
            showAlert = true
            print("Checkout failed: \(error.localizedDescription)")
        }
    }
}

#Preview {
    CheckOutView(order: Order())
}

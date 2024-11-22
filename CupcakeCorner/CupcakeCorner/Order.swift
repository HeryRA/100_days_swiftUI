//
//  Order.swift
//  CupcakeCorner
//
//  Created by RATSIMANOSIKA HERY on 20/11/2024.
//

import SwiftUI

@Observable
class Order: Codable {
    enum CodingKeys: String, CodingKey {
        case _type = "type"
        case _quantity = "quantity"
        case _specialRequestEnabled = "specialRequestEnabled"
        case _extraFrosting = "extraFrosting"
        case _addSprinkles = "addSprinkles"
        case _name = "name"
        case _streetAddress = "streetAddress"
        case _city = "city"
        case _zipCode = "zipCode"
    }
    
    static let currency = Locale.current.currency?.identifier ?? "USD"
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    var type = 0
    var quantity = 3
    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    var extraFrosting = false
    var addSprinkles = false
    var name = "" {
        didSet {
            save()
        }
    }
    var streetAddress = "" {
        didSet {
            save()
        }
    }
    var city = "" {
        didSet {
            save()
        }
    }
    var zipCode = "" {
        didSet {
            save()
        }
    }
    var hasValidAddress: Bool {
        return validate(name) && validate(streetAddress) && validate(city) && validate(zipCode)
    }
    var cost: Decimal {
        var cost = Decimal(quantity) * 2
        cost += Decimal(type) / 2
        if extraFrosting {
            cost += Decimal(quantity)
        }
        if addSprinkles {
            cost += Decimal(quantity) / 2
        }
        return cost
    }
    
    init () {
        guard let data = UserDefaults.standard.data(forKey: "order") else { return }
        guard let order = try? JSONDecoder().decode(Order.self, from: data) else { return }
        self.name = order.name
        self.streetAddress = order.streetAddress
        self.city = order.city
        self.zipCode = order.zipCode
    }
    
    private func validate(_ input: String) -> Bool {
        return !input.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    private func save() {
        guard let data = try? JSONEncoder().encode(self) else { return }
        UserDefaults.standard.set(data, forKey: "order")
    }
}

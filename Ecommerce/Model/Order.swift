//
//  Order.swift
//  Ecommerce
//
//  Created by Khumbongmayum Tonny on 20/01/24.
//

import SwiftUI

final class Order: ObservableObject {
    @Published var items: [OrderItem] = []
    @Published var count = 0
    @Published var showPopup = false

    func add(_ product: Product) {
        count += 1

        // check the item present on Order
        if let existingItemIndex = items.firstIndex(where: { $0.id == product.id }) {
            // If the product is already in the order, increment the count
            items[existingItemIndex].count += 1
        } else {
            // if not present append
            let orderItem = OrderItem(
                id: product.id,
                name: product.name,
                brand: product.brand,
                price: product.price,
                image: product.images.first ?? "empty",
                count: 1
            )

            items.append(orderItem)
        }
        print(items)
    }

    func incrementCount(for item: OrderItem) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index].count += 1
            count += 1
        }
    }

    func decrementCount(for item: OrderItem) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            if items[index].count > 1 {
                // If the count is greater than 1, decrement the count
                items[index].count -= 1
                count -= 1
            } else {
                showPopup = true
            }
        }
    }

    func removeItem(for item: OrderItem) {
        print(item, " REMOVE ITEM")
        if let itemIndexToRemove = items.firstIndex(where: { $0.id == item.id }) {
            items.remove(at: itemIndexToRemove)
            print("removed inside")
        }

        count -= 1
        print("removed")
        print(items)
    }

    var totalPrice: Double {
        items.reduce(0) { $0 + ($1.price * Double($1.count)) }
    }
}

struct OrderItem {
    var id: UUID
    var name: String // "Dot print corset dress", "Blazer with tuxedo collar" etc
    var brand: String // "Mohani", "Diolo", "Loriani", "Totto", "Jole" etc
    var price: Double // 45.00...950.00
    var image: String // ["100001", "200001", "300001" etc]
    var count: Int
}

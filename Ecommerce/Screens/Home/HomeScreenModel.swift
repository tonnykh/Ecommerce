//
//  HomeScreenModel.swift
//  Ecommerce
//
//  Created by Khumbongmayum Tonny on 19/01/24.
//
// HomeScreenModel.swift

import SwiftUI

@MainActor class HomeScreenModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var adaptiveColumn = [
        GridItem(.adaptive(minimum: 150))
    ]

    init() {
        loadProducts()
    }

    func loadProducts() {
        Task {
            do {
                self.products = try await NetworkManager.shared.loadData(from: "catalog")
            } catch {
                print("Error loading products: \(error.localizedDescription)")
            }
        }
    }

}

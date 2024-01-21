//
//  Product.swift
//  Ecommerce
//
//  Created by Khumbongmayum Tonny on 19/01/24.
//

import Foundation


struct Product: Codable, Hashable {
    var id: UUID
    var name: String // "Dot print corset dress", "Blazer with tuxedo collar" etc
    var brand: String // "Mohani", "Diolo", "Loriani", "Totto", "Jole" etc
    var price: Double // 45.00...950.00
    var images: [String] // ["100001", "200001", "300001" etc]
    var material: String // "Cotton", "Wool", "Linum" etc
    var information: String // "Long sleeve jacket with tuxedo collar. Front flap pockets..." etc
}

struct ProductResponse: Decodable {
    let audiences: [Audiences]
}

struct Audiences: Decodable {
    let id: UUID
    let name: String // "Women", "Men", "Kids"
    let categories: [Category]
}

struct Category: Decodable {
    let id: UUID
    let name: String // "Apparel", "Shoes", "Bags", "Accessoires"
    let products: [Product]
}

struct MockData {

    static let sampleProduct = Product(
        id: UUID(),
        name: "Dot print corset dress",
        brand: "Mohani",
        price: 90.00,
        images: ["1001.jpg", "1001.jpg", "1001.jpg"],
        material: "Cotton",
        information: "Elevate your style with this long sleeve jacket featuring a tuxedo collar. Its timeless design exudes sophistication and elegance. The jacket is equipped with front flap pockets and a chest welt pocket, adding a touch of functionality without compromising on style. The tonal matching inner lining creates a seamless and harmonious look from the inside out. With a front button closure, this jacket ensures a polished and refined appearance."
    )

    static let products = [orderItemOne, orderItemTwo]

    static let orderItemOne = OrderItem(
        id: UUID(),
        name: "Dot print corset dress",
        brand: "Mohani",
        price: 90.00,
        image: "1001.jpg",
        count: 1
    )

    static let orderItemTwo = OrderItem(
        id: UUID(),
        name: "Blazer with tuxedo collar",
        brand: "Diolo",
        price: 75.00,
        image: "1002.jpg",
        count: 1
    )
}

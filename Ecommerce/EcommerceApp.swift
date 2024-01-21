//
//  EcommerceApp.swift
//  Ecommerce
//
//  Created by Khumbongmayum Tonny on 19/01/24.
//

import SwiftUI

@main
struct EcommerceApp: App {

    var order = Order()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeScreen().environmentObject(order)
            }
        }
    }
}

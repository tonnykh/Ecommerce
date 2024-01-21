//
//  CartScreen.swift
//  Ecommerce
//
//  Created by Khumbongmayum Tonny on 20/01/24.
//

import SwiftUI

struct CartScreen: View {
    @EnvironmentObject var order: Order
    @Environment(\.dismiss) private var dismiss
    @State var showPopup = false
    @State private var itemIndexToRemove: Int?
    @State var selectedItem: OrderItem?
    @State var showCheckoutScreen = false

    var body: some View {
        ZStack() {
            VStack {
                HeaderCloseView(title: "cart")

                if order.items.isEmpty {
                    EmptyState()
                } else {
                    ScrollView {
                        ForEach(order.items, id: \.id) { item in
                            CartItemCell(product: item, selectedItem: $selectedItem)
                        }
                    }

                    Spacer()

                    Image("lineGray")
                        .frame(maxWidth: .infinity)
                    FooterTotalPriceView(totalPrice: order.totalPrice)
                }

                Button {
                    if order.items.isEmpty {
                        dismiss()
                    } else {
                        showCheckoutScreen = true
                    }
                } label: {
                    ECButton(buttonImageName: "cartWhite",
                             buttonLabel: "\(order.items.isEmpty ? "continue shopping" : "checkout")")
                }
                .modifier(ButtonStandardStyle())
            }
            .disabled(showPopup)

            if order.showPopup {
                PopupView(isShowingPopup: $showPopup,
                          selectedItem: selectedItem ?? MockData.orderItemOne)
            }
        }
        .fullScreenCover(isPresented: $showCheckoutScreen) {
            CheckoutScreen()
        }
    }
    
}

#Preview {
    CartScreen(selectedItem: MockData.orderItemOne)
}

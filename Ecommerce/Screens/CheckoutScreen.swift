//
//  CheckoutScreen.swift
//  Ecommerce
//
//  Created by Khumbongmayum Tonny on 20/01/24.
//

import SwiftUI

struct CheckoutScreen: View {
    @EnvironmentObject var order: Order
    @State var selectedItem: OrderItem?
    @State var showPopup = false
    @State private var itemIndexToRemove: Int?
    @State var showAddressScreen = false
    @State var showPaymentMethodScreen = false

    var body: some View {
        ZStack {
            NavigationStack {
                VStack {
                    HeaderCloseView(title: "checkout")
                        .padding(.bottom)

                    VStack(alignment: .leading, spacing: 15) {
                        Text("Shipping Address".uppercased())
                            .font(Font.custom("TenorSans", size: 14))
                            .foregroundStyle(.primaryGrayLight)
                            .tracking(1)

                        Button {
                            showAddressScreen = true
                        } label: {
                            ECButtonGray(buttonImageName: "plusBlack", buttonLabel: "Add shipping address")
                        }
                        .modifier(ButtonStandardStyle(colorGray: true))
                        .navigationDestination(
                            isPresented: $showAddressScreen) {
                                AddressScreen()
                            }
                    }
                    .padding(.vertical)

                    Image("lineGray")

                    VStack(alignment: .leading, spacing: 12) {
                        Text("Payment Method".uppercased())
                            .font(Font.custom("TenorSans", size: 14))
                            .foregroundStyle(.primaryGrayLight)
                            .tracking(1)

                        Button {
                            showPaymentMethodScreen = true
                        } label: {
                            ECButtonGray(buttonImageName: "plusBlack", buttonLabel: "Add payment card")
                        }
                        .modifier(ButtonStandardStyle(colorGray: true))
                        .navigationDestination(
                            isPresented: $showPaymentMethodScreen) {
                                PaymentMethodScreen()
                            }
                    }
                    .padding(.vertical)

                    Image("lineGray")

                    Spacer()

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
                            let rootViewController = UIApplication.shared.connectedScenes
                                .filter {$0.activationState == .foregroundActive }
                                .map {$0 as? UIWindowScene }
                                .compactMap { $0 }
                                .first?.windows
                                .filter({ $0.isKeyWindow }).first?.rootViewController

                            rootViewController?.dismiss(animated: true)
                        }
                        print("button")
                    } label: {
                        ECButton(buttonImageName: "cartWhite",
                                 buttonLabel: "\(order.items.isEmpty ? "continue shopping" : "place order")")
                    }
                    .modifier(ButtonStandardStyle())
                }
                .disabled(showPopup)
            }

            if order.showPopup {
                PopupView(isShowingPopup: $showPopup,
                          selectedItem: selectedItem ?? MockData.orderItemOne)
            }
        }
    }
}

#Preview {
    CheckoutScreen()
}

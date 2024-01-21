//
//  ProductDetailsScreen.swift
//  Ecommerce
//
//  Created by Khumbongmayum Tonny on 19/01/24.
//

import SwiftUI

struct ProductDetailsScreen: View {
    @EnvironmentObject var order: Order
    @Environment(\.presentationMode) var presentationMode
    let product: Product

    var body: some View {
        NavigationStack {
            VStack {
                HeaderLogoView()
                    .overlay(alignment: .leading) {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                            print("Back Home")
                        }) {
                            Image("back")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .padding(.leading, 15)
                        }
                    }

                Spacer()

                ScrollView {
                    VStack(alignment: .leading) {
                        if let imageName = product.images.first,
                           let imageURL = URL(string: imageName) {
                            Image(imageURL.deletingPathExtension().lastPathComponent)
                                .resizable()
                                .scaledToFit()
                                .clipShape(
                                    RoundedRectangle(cornerRadius: 6.0)
                                )
                        }

                        VStack(alignment: .leading, spacing: 8) {
                            Text(product.brand)
                                .font(Font.custom("TenorSans", size: 16.0))
                                .tracking(3)

                            Text(product.name)
                                .font(Font.custom("TenorSans", size: 16.0))
                                .foregroundStyle(.primaryGray)

                                .font(Font.custom("TenorSans", size: 18.0))
                            Text("$\(product.price, specifier: "%.f")")
                                .foregroundStyle(.accent)
                        }
                        .padding(.vertical, 20)

                        Text("Description".uppercased())
                            .font(Font.custom("TenorSans", size: 14.0))
                            .tracking(2)
                            .padding(.bottom, 8)

                        Text(product.information)
                            .font(Font.custom("TenorSans", size: 14.0))
                            .lineSpacing(8)
                            .foregroundStyle(.primaryGray)

                    }
                    .padding()
                }
                .toolbar {
                    ToolbarItem(placement: .bottomBar){
                        Button {
                            order.add(product)
                            print(order.items.count)
                        } label: {
                            ECButton(buttonImageName: "plusWhite", buttonLabel: "Add to cart")
                        }
                        .modifier(ButtonStandardStyle())
                    }
                }

            }
        }
    }
}

#Preview {
    ProductDetailsScreen(product: MockData.sampleProduct)
}

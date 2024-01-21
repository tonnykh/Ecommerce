//
//  CartItemCell.swift
//  Ecommerce
//
//  Created by Khumbongmayum Tonny on 21/01/24.
//

import SwiftUI

struct CartItemCell: View {
    @EnvironmentObject var order: Order
    var product: OrderItem
    @Binding var selectedItem: OrderItem?

    var body: some View {
        HStack {
            if let imageURL = URL(string: product.image) {
                Image(imageURL.deletingPathExtension().lastPathComponent)
                    .resizable()
                    .frame(width: 100)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 4)
                    )
            }

            VStack(alignment: .leading) {
                Group {
                    Text(product.brand.uppercased())
                        .font(Font.custom("TenorSans", size: 14))
                        .tracking(2)
                        .padding(.bottom, 1)

                    Text(product.name)
                        .font(Font.custom("TenorSans", size: 12))
                        .foregroundStyle(.primaryGray)
                }

                Spacer()

                Group {
                    HStack(spacing: 5) {
                        Image("minusCircled")
                            .onTapGesture {
                                order.decrementCount(for: product)
                                if product.count == 1 {
                                    selectedItem = product
                                }
                            }

                        Text("\(product.count)")
                            .foregroundStyle(.black)

                        Image("plusCircled")
                            .onTapGesture {
                                order.incrementCount(for: product)
                            }
                    }
                    .offset(x: -10)
                    .font(Font.custom("TenorSans", size: 12))

                    Text("$\(product.price , specifier: "%.f")")
                        .font(Font.custom("TenorSans", size: 15))
                        .foregroundStyle(.accent)
                }
            }
            .padding(4)

            Spacer()
        }
        .padding(.vertical, 7)
        .padding(.horizontal, 25)
        .frame(height: 150)
        .frame(maxWidth: .infinity)
    }
}

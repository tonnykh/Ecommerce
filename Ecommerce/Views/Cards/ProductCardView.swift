//
//  ProductCell.swift
//  Ecommerce
//
//  Created by Khumbongmayum Tonny on 19/01/24.
//

import SwiftUI

struct ProductCardView: View {
    let product: Product

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {

            if let imageName = product.images.first,
               let imageURL = URL(string: imageName) {
                Image(imageURL.deletingPathExtension().lastPathComponent)
                    .resizable()
                    .frame(width: 175, height: 230)
                    .clipShape(RoundedRectangle(cornerRadius: 4.0))
            }

            Group {
                Text(product.brand)
                    .font(Font.custom("TenorSans", size: 12.0))
                    .padding(.top, 8)
                    .foregroundStyle(.black)

                Text(product.name)
                    .font(Font.custom("TenorSans", size: 12.0))
                    .foregroundStyle(.primaryGray)

                Text("$\(product.price, specifier: "%.f")")
                    .font(Font.custom("TenorSans", size: 15.0))
                    .foregroundStyle(.accent)
                    .padding(.top, 5)
            }
            .padding(.leading, 5)
        }
    }
}

#Preview {
    ProductCardView(product: MockData.sampleProduct)
}

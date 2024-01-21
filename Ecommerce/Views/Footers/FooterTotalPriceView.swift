//
//  FooterTotalPriceView.swift
//  Ecommerce
//
//  Created by Khumbongmayum Tonny on 21/01/24.
//

import SwiftUI

struct FooterTotalPriceView: View {
    var totalPrice: Double

    var body: some View {
        HStack {
            Text("TOTAL")
                .font(Font.custom("TenorSans", size: 14))
                .tracking(2)
                .foregroundStyle(.black)

            Spacer()

            Text("$\(totalPrice, specifier: "%.f")")
                .font(Font.custom("TenorSans", size: 16))
                .foregroundStyle(.accent)
                .tracking(3)
        }
        .padding(.top, 5)
        .padding([.horizontal, .bottom])
        .padding(.horizontal, 8)
    }
}

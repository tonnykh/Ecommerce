//
//  ECButtonGray.swift
//  Ecommerce
//
//  Created by Khumbongmayum Tonny on 21/01/24.
//

import SwiftUI

struct ECButtonGray: View {
    var buttonImageName: String?
    var buttonLabel: String

    var body: some View {
        HStack(spacing: 0) {
            Text("\(buttonLabel)")
                .font(Font.custom("TenorSans", size: 16.0))
                .foregroundStyle(.primaryGray)

            Spacer()

            if let buttonImageName {
                Image(buttonImageName)
                    .resizable()
                    .frame(width: 20, height: 20)
            }
        }
        .foregroundStyle(.black)
        .frame(maxWidth: UIScreen.main.bounds.width * 0.78)
    }
}

//
//  ECButton.swift
//  Ecommerce
//
//  Created by Khumbongmayum Tonny on 21/01/24.
//

import SwiftUI

struct ECButton: View {
    var buttonImageName: String?
    var buttonLabel: String

    var body: some View {
        HStack(spacing: 0) {
            if let buttonImageName {
                Image(buttonImageName)
                    .resizable()
                    .frame(width: 20, height: 20)
            }
            Text("  \(buttonLabel.uppercased())")
                .font(Font.custom("TenorSans", size: 16.0))
        }
        .foregroundStyle(.white)
        .frame(maxWidth: UIScreen.main.bounds.width * 0.73)
    }
}

//
//  EmptyState.swift
//  Ecommerce
//
//  Created by Khumbongmayum Tonny on 21/01/24.
//

import SwiftUI

struct EmptyState: View {
    var body: some View {
        Text("Your card is empty.\nChoose the best goods from our catalog")
            .multilineTextAlignment(.center)
            .font(Font.custom("TenorSans", size: 16))
            .foregroundStyle(.primaryGray)
            .offset(y: 80)
            .lineSpacing(5)

        Spacer()
    }
}

#Preview {
    EmptyState()
}

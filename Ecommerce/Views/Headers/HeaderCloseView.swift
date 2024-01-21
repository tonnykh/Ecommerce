//
//  HeaderCloseView.swift
//  Ecommerce
//
//  Created by Khumbongmayum Tonny on 21/01/24.
//

import SwiftUI

struct HeaderCloseView: View {
    @Environment(\.dismiss) private var dismiss
    @State var title: String
    @State var showCloseButton = true

    var body: some View {
        VStack {
            if showCloseButton {
                Button(action: {
                    dismiss()
                }) {
                    Image("closeBlack")
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
            }

            Text(title.uppercased())
                .foregroundStyle(.black)
                .font(Font.custom("TenorSans", size: 18))
                .tracking(4)

            Image("spacer")
        }
        .frame(maxWidth: .infinity)
    }
}

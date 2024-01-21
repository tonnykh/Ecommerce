//
//  HeaderLogoView.swift
//  Ecommerce
//
//  Created by Khumbongmayum Tonny on 21/01/24.
//

import SwiftUI

struct HeaderLogoView: View {
    @EnvironmentObject var order: Order
    @State var showCartScreen = false

    var body: some View {
        HStack {
            Spacer()

            Image("logo")
                .resizable()
                .frame(width: 90, height: 37)
                .padding(.leading, 40)

            Spacer()

            Button(action: {
                showCartScreen.toggle()
            }, label: {
                Image("cartBlack")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .overlay {
                        NotificationCountView(value: .constant(order.count))
                    }
            })
            .padding(.trailing, 15)
            .offset(y: 3)
            .fullScreenCover(isPresented: $showCartScreen) {
                CartScreen()
            }
        }
        .foregroundColor(.white)
        .padding(.top, 5)
        .padding(.bottom, 16)
        .frame(maxWidth: .infinity)
    }
}


#Preview {
    HeaderLogoView()
}

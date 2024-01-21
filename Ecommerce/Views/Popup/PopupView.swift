//
//  PopupView.swift
//  Ecommerce
//
//  Created by Khumbongmayum Tonny on 20/01/24.
//

import SwiftUI

struct PopupView: View {
    @EnvironmentObject var order: Order
    @Binding var isShowingPopup: Bool
    var selectedItem: OrderItem

    var body: some View {

        ZStack {

            Color.black.opacity(0.8)

            VStack {
                Button(action: {
                    order.showPopup = false
                }, label: {
                    Image("closeBlack")
                })
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity, alignment: .trailing)

                Text("we care".uppercased())
                    .font(Font.custom("TenorSans", size: 18))
                    .tracking(4)
                Image("spacer")

                Spacer()

                Image("message")

                Spacer()

                Text("Remove this item from the shopping cart?")
                    .font(Font.custom("TenorSans", size: 18))
                    .multilineTextAlignment(.center)

                Spacer()

                Button {
                    print("remove button pressed")
                    order.removeItem(for: selectedItem)
                    order.showPopup = false
                    print("Selected item : \(selectedItem.brand)")
                } label: {
                    ECButton(buttonLabel: "remove")
                }
                .modifier(ButtonStandardStyle())
                .padding()
            }
            .padding(20)
            .frame(width: 320, height: 370)
            .background(.white)
            .clipShape(
                RoundedRectangle(cornerRadius: 30)
            )
            .shadow(radius: 40)
        }
        .foregroundStyle(.black)
        .ignoresSafeArea()
    }

}

#Preview {
    PopupView(isShowingPopup: .constant(false), selectedItem: MockData.orderItemOne)
}

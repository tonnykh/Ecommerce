//
//  PaymentMethodScreen.swift
//  Ecommerce
//
//  Created by Khumbongmayum Tonny on 20/01/24.
//

import SwiftUI

struct PaymentMethodScreen: View {
    @Environment(\.presentationMode) var presentationMode
    @State var nameOnCard: String = ""
    @State var cardNumber: String = ""
    @State var expMonth: String = ""
    @State var expYear: String = ""
    @State var cvv: String = ""

    var body: some View {

        HeaderCloseView(title: "payment method", showCloseButton: false)
            .padding(.top, 50)
            .overlay(alignment: .leading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image("back")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .padding(.leading, 15)
                        .padding(.bottom)
                }
            }

        VStack {
            TextFieldWithBottomLine(placeholderLabel: "Name On Card*",
                            textField: $nameOnCard)

            TextFieldWithBottomLine(placeholderLabel: "Card Number*",
                            textField: $cardNumber)

            HStack {
                TextFieldWithBottomLine(placeholderLabel: "Exp Month*",
                                textField: $expMonth)

                TextFieldWithBottomLine(placeholderLabel: "Exp Year*",
                                textField: $expYear)
            }

            TextFieldWithBottomLine(placeholderLabel: "CVV*",
                            textField: $cvv)
        }
        .padding()
        .padding(.top, 30)
        .padding(.horizontal, 10)

        Spacer()

        Button {

        } label: {
            ECButton(buttonImageName: "plusWhite", buttonLabel: "add card")
        }
        .modifier(ButtonStandardStyle())

    }
}

#Preview {
    PaymentMethodScreen(nameOnCard: "One",
                        cardNumber: "One",
                        expMonth: "One",
                        expYear: "One",
                        cvv: "One")
}

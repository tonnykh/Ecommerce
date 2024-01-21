//
//  AddressScreen.swift
//  Ecommerce
//
//  Created by Khumbongmayum Tonny on 20/01/24.
//

import SwiftUI

struct AddressScreen: View {
    @Environment(\.presentationMode) var presentationMode
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var address: String = ""
    @State var city: String = ""
    @State var state: String = ""
    @State var zipCode: String = ""
    @State var country: String = ""
    @State var phoneNumber: String = ""

    var body: some View {
        HeaderCloseView(title: "shipping address", showCloseButton: false)
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

        GeometryReader { _ in
            ScrollView {
                VStack {
                    HStack {
                        TextFieldWithBottomLine(
                            placeholderLabel: "First Name*",
                            textField: $firstName)

                        Spacer()

                        TextFieldWithBottomLine(
                            placeholderLabel: "Last Name*",
                            textField: $lastName)
                    }

                    TextFieldWithBottomLine(
                        placeholderLabel: "Address*",
                        textField: $address)

                    TextFieldWithBottomLine(
                        placeholderLabel: "City*",
                        textField: $city)

                    HStack {
                        TextFieldWithBottomLine(
                            placeholderLabel: "State",
                            textField: $state)

                        Spacer()

                        TextFieldWithBottomLine(
                            placeholderLabel: "ZIP code*",
                            textField: $zipCode)
                    }

                    TextFieldWithBottomLine(
                        placeholderLabel: "Country*",
                        textField: $country)

                    TextFieldWithBottomLine(
                        placeholderLabel: "Phone Number*",
                        textField: $phoneNumber)
                }
                .padding()
                .padding(.top, 30)
                .padding(.horizontal, 10)
                .ignoresSafeArea(.keyboard, edges: .bottom)
            }
        }

        Spacer()

        Button {
            print("Button Save address")
        } label: {
            ECButton(buttonImageName: "plusWhite", buttonLabel: "save address")
        }
        .modifier(ButtonStandardStyle())
    }
}

#Preview {
    AddressScreen(firstName: "one",
                  lastName: "one 2",
                  address: "one 3",
                  city: "one 4",
                  state: "one",
                  zipCode: "one",
                  country: "one",
                  phoneNumber: "one")
}

//
//  TextFieldWithBottomLine.swift
//  Ecommerce
//
//  Created by Khumbongmayum Tonny on 21/01/24.
//

import SwiftUI

struct TextFieldWithBottomLine: View {
    var placeholderLabel: String
    @Binding var textField: String

    var body: some View {
        GeometryReader { geometry in
            VStack {
                TextField(placeholderLabel, text: $textField)
                    .foregroundStyle(.black)
                Image("lineGray")
                    .resizable()
                    .frame(
                        width: geometry.size.width ,
                        height: 1)
            }
            .font(Font.custom("TenorSans", size: 16))
            .frame(
                width: geometry.size.width ,
                height: 1
            )
        }
        .frame(height: 75)
    }
}

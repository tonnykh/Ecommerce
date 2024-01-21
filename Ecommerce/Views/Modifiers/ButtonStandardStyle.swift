//
//  StandardButtonStyle.swift
//  Ecommerce
//
//  Created by Khumbongmayum Tonny on 20/01/24.
//

import SwiftUI

struct ButtonStandardStyle: ViewModifier {

    @State var colorGray = false

    func body(content: Content) -> some View {
        content
            .buttonStyle(.borderedProminent)
//            .tint(.black)
            .tint(colorGray ? .gray.opacity(0.1) : .black)
            .controlSize(.extraLarge)
    }
}

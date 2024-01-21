//
//  ContentView.swift
//  Ecommerce
//
//  Created by Khumbongmayum Tonny on 19/01/24.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject private var viewModel = HomeScreenModel()

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {

                HeaderLogoView()

                ScrollView {
                    LazyVGrid(columns: viewModel.adaptiveColumn, spacing: 20) {
                        ForEach(viewModel.products, id: \.id) { product in
                            NavigationLink(destination: ProductDetailsScreen( product: product)) {
                                ProductCardView(product: product)
                            }
                        }
                    }
                }
                .padding(.horizontal, 12)
                .padding(.bottom)
                .ignoresSafeArea()
                .scrollIndicators(.hidden)
                .navigationBarBackButtonHidden()
            }
        }
    }
}

#Preview {
    HomeScreen()
}

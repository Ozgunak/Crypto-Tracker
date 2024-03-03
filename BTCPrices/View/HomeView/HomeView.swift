//
//  HomeView.swift
//  BTCPrices
//
//  Created by özgün aksoy on 2024-02-09.
//

import SwiftUI

struct HomeView: View {
    @State private var model = HomeViewModel()
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                NavigationLink(destination: PortfolioView().navigationBarTitleDisplayMode(.large)) {
                    PortfolioPreview()
                }
                TopMoversView(coins: model.moverCoins)
                AllCoinsView()
                    .environment(model)
            }
            .navigationTitle("Live Prices")
        }
//        .task {
//            getPrices()
//        }
        .refreshable {
            model.page = 0
            await model.getCoinsPrices()
        }
    }
    
    func getPrices() {
        Task {
            await model.getCoinsPrices()
        }
    }
}

#Preview {
    NavigationStack  {
        HomeView()
    }
}

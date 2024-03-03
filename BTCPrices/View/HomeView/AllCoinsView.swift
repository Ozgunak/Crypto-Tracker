//
//  AllCoinsView.swift
//  BTCPrices
//
//  Created by özgün aksoy on 2024-02-09.
//

import SwiftUI

struct AllCoinsView: View {
//    var coins: [Coin]
    @Environment(HomeViewModel.self) private var homeVM
    var body: some View {
        VStack(alignment: .leading) {
            Text("All Coins")
                .font(.headline)
                .padding(.top)
            HStack {
                Text("Coin")
                    
                Spacer()
                Text("Price")
            }
            .font(.caption)
            .padding(.top)
            
            ScrollView {
                VStack {
                    ForEach(homeVM.coins) { coin in
                        NavigationLink(destination: CoinDetailView(coin: coin)) {
                            CoinRowView(coin: coin)
                                .onAppear {
                                    if coin.id == homeVM.coins.last?.id {
                                        Task { await homeVM.getCoinsPrices() }
                                    }
                                }
                        }
                    }
                }
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    NavigationStack {
        AllCoinsView()
            .environment(HomeViewModel())
    }
}
                         


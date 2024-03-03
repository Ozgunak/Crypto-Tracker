//
//  TopMoversView.swift
//  BTCPrices
//
//  Created by özgün aksoy on 2024-02-08.
//

import SwiftUI

struct TopMoversView: View {
    var coins: [Coin]
    var body: some View {
        VStack(alignment: .leading) {
            Text("Top Movers")
                .font(.headline)
            ScrollView(.horizontal) {
                HStack(spacing: 12) {
                    ForEach(coins) { coin in
                        TopMoversItemView(coin: coin)
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    TopMoversView(coins: [Coin.MOCK_COIN, Coin.MOCK_COIN])
}

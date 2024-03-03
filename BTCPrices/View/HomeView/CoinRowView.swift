//
//  CoinRowView.swift
//  BTCPrices
//
//  Created by özgün aksoy on 2024-02-09.
//

import SwiftUI
import Kingfisher

struct CoinRowView: View {
    var coin: Coin
    var body: some View {
        HStack {
            Text("\(Int(coin.marketCapRank ?? 1))")
            
            KFImage(URL(string: coin.image))
                .resizable()
                .frame(width: 36, height: 36)
                .foregroundStyle(.orange)
                .padding(.leading, 6)
            
            
            VStack(alignment: .leading, spacing: 4) {
                Text(coin.name.capitalized)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text(coin.symbol.uppercased())
                    .font(.caption)
            }
            Spacer()
            
            VStack(alignment: .trailing, spacing: 4) {
                Text(String(format: "%.2f", coin.currentPrice))
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text(String(coin.priceChangePercentage24H ?? 0))
                    .font(.caption)
                    .foregroundStyle(coin.priceChangePercentage24H ?? 0 <= 0 ? .red : .green)
            }
        }
    }
}

#Preview {
    CoinRowView(coin: Coin.MOCK_COIN)
}

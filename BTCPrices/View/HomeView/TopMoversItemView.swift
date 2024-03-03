//
//  TopMoversItemView.swift
//  BTCPrices
//
//  Created by özgün aksoy on 2024-02-08.
//

import SwiftUI
import Kingfisher

struct TopMoversItemView: View {
    var coin: Coin
    var percentString: String {
        if let percent = coin.priceChangePercentage24H {
            return percent > 0 ? "+\(percent.toPercentString())" : "-\(percent.toPercentString())"
        } else { return ""}
    }
    var body: some View {
        VStack(alignment: .leading) {
            KFImage(URL(string: coin.image))
                .resizable()
                .frame(width: 32, height: 32)
            HStack {
                Text(coin.symbol.uppercased())
                    .font(.caption)
                .fontWeight(.bold)
                Text(coin.currentPrice.toCurrency())
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            
            Text(percentString)
                .font(.title2)
                .foregroundStyle(.green)
                
        }
        .frame(width: 140, height: 140)
        .overlay {
            RoundedRectangle(cornerRadius: 6)
                .stroke(Color(.systemGray4), lineWidth: 2)
        }
    }
}

#Preview {
    TopMoversItemView(coin: Coin.MOCK_COIN)
}

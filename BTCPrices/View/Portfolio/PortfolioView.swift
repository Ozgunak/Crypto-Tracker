//
//  PortfolioView.swift
//  BTCPrices
//
//  Created by özgün aksoy on 2024-02-12.
//

import SwiftUI
import SwiftData

struct PortfolioView: View {
//    @Query private var portfolio: Portfolio
    var body: some View {
        VStack {
            PortfolioTopView()
            PortfolioCoinsView()
            Spacer()
        }
        .navigationTitle("Portfolio")
        .padding(.horizontal)
    }
}

struct PortfolioTopView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Total Holdings")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Text("$2,945.19")
                        .font(.title2)
                        .fontWeight(.bold)
                }
                Spacer()
                VStack(alignment: .trailing, spacing: 8) {
                    Text("New Change")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Text("-65.53%")
                        .font(.title2)
                        .fontWeight(.bold)
                }
            }
            
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Avaliable Cash")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Text("$0.00")
                        .font(.title2)
                        .fontWeight(.bold)
                }
                Spacer()
                VStack(alignment: .trailing, spacing: 8) {
                    Text("Invesments")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Text("$2,945.19")
                        .font(.title2)
                        .fontWeight(.bold)
                }
            }
            .padding(.top)
        }
        .padding()
        .padding(.vertical)
        .foregroundStyle(.white)
        .background {
            RoundedRectangle(cornerRadius: 6)
                .fill(LinearGradient(colors: [.purple, .blue], startPoint: .leading, endPoint: .bottomTrailing))
                .shadow(color: .gray, radius: 10)
        }
        .padding(.bottom)
    }
}

struct PortfolioCoinsView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("My Coins")
                .font(.headline)
                .padding(.top)
            ScrollView {
                VStack {
                    ForEach(0 ..< 5, id: \.self) { coin in
                        NavigationLink {
                            WalletCoinDetailView(coin: .MOCK_COIN)
                                .navigationBarBackButtonHidden()
                        } label: {
                            CoinRowView(coin: Coin.MOCK_COIN)
                        }

                        
                    }
                }
            }
        }
    }
}



#Preview {
    NavigationStack {
        PortfolioView()
    }
}

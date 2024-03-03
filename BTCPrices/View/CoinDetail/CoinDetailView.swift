//
//  CoinDetailView.swift
//  BTCPrices
//
//  Created by özgün aksoy on 2024-02-14.
//

import SwiftUI
import Charts
import Kingfisher

struct CoinDetailView: View {
    @State private var chartModel = ChartViewModel()
    @State private var detailModel = CoinModelView()
    
    @State private var isPresented: Bool = false
    @State private var actionType: BuySellState = .buy

    var coin: Coin
    var body: some View {
        VStack(alignment: .leading) {
            
            chartView
            overview
            HStack {
                VStack(alignment: .leading, spacing: 30) {
                    price(title: "Current Price", price: detailModel.coinDetail?.marketData.currentPrice["usd"] ?? 0, percentage: detailModel.coinDetail?.marketData.priceChange24H ?? 0)
                    rankAndVolume(title: "Rank", amount: detailModel.coinDetail?.marketCapRank.formatted() ?? "")

                }
                Spacer()
                VStack(alignment: .leading, spacing: 30) {
                    price(title: "Market Capitalizations", price: detailModel.coinDetail?.marketData.marketCap["usd"] ?? 0, percentage: detailModel.coinDetail?.marketData.marketCapChangePercentage24H ?? 0)
                    rankAndVolume(title: "Volume", amount: detailModel.coinDetail?.marketData.totalVolume["usd"]?.toCurrency() ?? "")
                }
            }
            .padding()
            Spacer()
            bottomButtonView
                .sheet(isPresented: $isPresented, content: {
                    BuySellView(actionState: actionType, coin: coin)
                })
        }
        .navigationTitle(coin.name.capitalized)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                HStack {
                    Text(coin.symbol.uppercased())
                        .font(.subheadline)
                    KFImage(URL(string: coin.image))
                        .resizable()
                        .frame(width: 24, height: 24)
                }
            }
        }
        .task {
            detailModel.getCoinDetails(coin: coin)
        }
    }
    
    private var chartView: some View {
        Chart {
            ForEach(chartModel.prices) { price in
                LineMark(x: .value("Date", price.date), y: .value("Price", price.price))
                    .lineStyle(StrokeStyle(lineWidth: 4, lineJoin: .bevel))
                    .shadow(radius: 10, y: 10)
            }
        }
        .chartYScale(domain: chartModel.min ... chartModel.max)
        .task {
            chartModel.getChartData()
        }
        .padding()
        .frame(height: 250)
    }
    
    private var overview: some View {
        Text("Overview")
            .font(.title)
            .fontWeight(.bold)
            .padding(.horizontal)
    }
    
    private func price(title: String, price: Double, percentage: Double) -> some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.subheadline)
                .foregroundStyle(Color(.systemGray2))
            Text(price.toCurrency())
                .font(.headline)
                .fontWeight(.bold)
            HStack {
                
            }
            
        }
    }
    
    private func rankAndVolume(title: String, amount: String) -> some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.subheadline)
                .foregroundStyle(Color(.systemGray2))
            Text(amount)
                .font(.headline)
                .fontWeight(.bold)
        }
    }
    
    private var bottomButtonView: some View {
        HStack {
            Button(action: {
                actionType = .buy
                isPresented.toggle()
            }, label: {
                Text(BuySellState.buy.rawValue.capitalized)
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding()
                    .frame(width: 150, height: 60)
                    .background {
                        RoundedRectangle(cornerRadius: 8.0)
                            .fill(.blue)
                    }
            })
            Spacer()
            Button(action: {
                actionType = .sell
                isPresented.toggle()
            }, label: {
                Text(BuySellState.sell.rawValue.capitalized)
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding()
                    .frame(width: 150, height: 60)
                    .background {
                        RoundedRectangle(cornerRadius: 8.0)
                            .fill(.red)
                    }
            })
        }
        .padding()
    }

}

#Preview {
    NavigationStack {
        CoinDetailView(coin: .MOCK_COIN)
    }
}


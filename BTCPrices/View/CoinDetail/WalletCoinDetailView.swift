//
//  WalletCoinDetailView.swift
//  BTCPrices
//
//  Created by özgün aksoy on 2024-02-12.
//

import SwiftUI
import Kingfisher

struct WalletCoinDetailView: View {
    @Environment(\.dismiss) var dismiss
    var coin: Coin
    @State private var isPresented: Bool = false
    @State private var actionType: BuySellState = .buy

    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            backButton
            
            coinLabel
            
            priceLabel
            
            currentAmount
            
            portfolioBoxes
            
            transactionHeader
            
            // TODO: add transaction history / update row view
            ScrollView {
                VStack {
                    ForEach(0 ..< 3, id: \.self) { transaction in
                        TransactionRowView()
                    }
                }
            }
            
            Divider()

            bottomButtonView
                .sheet(isPresented: $isPresented, content: {
                    BuySellView(actionState: actionType, coin: coin)
                })

        }
        .padding(.horizontal)

    }
    
    
    private var backButton: some View {
        Button(action: {dismiss()}, label: {
            Image(systemName: "arrow.backward")
                .resizable()
                .frame(width: 24, height: 18)
                .foregroundStyle(.black)
                .padding(.bottom)
        })
    }
    
    private var coinLabel: some View {
        HStack {
            KFImage(URL(string: coin.image))
                .resizable()
                .frame(width: 60, height: 60)
            
            Text(coin.name.capitalized)
                .font(.headline)
                .fontWeight(.semibold) +
            Text("  (\(coin.symbol.uppercased()))")
                .font(.caption)
        }
    }
    
    private var priceLabel: some View {
        HStack {
            Text(coin.currentPrice.toCurrency())
                .font(.title)
                .fontWeight(.bold)
            
            Spacer()
            HStack {
                Image(systemName: coin.priceChangePercentage24H ?? 0 >= 0 ? "arrowtriangle.up.fill" : "arrowtriangle.down.fill")
                    .resizable()
                    .frame(width: 16, height: 16)
                //                    Text(String(format: ".%2d", coin.priceChangePercentage24H ?? 0))
                Text(coin.priceChangePercentage24H?.formatted(.number.precision(.fractionLength(2))) ?? "") +
                Text(" %")
            }
            .padding(8)
            .foregroundStyle(.white)
            .background {
                RoundedRectangle(cornerRadius: 6)
                    .fill(coin.priceChangePercentage24H ?? 0 >= 0 ? .green : .red)
            }
        }
    }
    
    private var currentAmount: some View {
        HStack {
            Text("0.01")
                
            Text(coin.symbol.uppercased())
        }
        .font(.headline)
    }
    
    private func grayBox(image: String, imageColor: Color, title: String, value: String) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Image(systemName: image)
                .resizable()
                .frame(width: 48, height: 48)
                .foregroundStyle(imageColor)
            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)
            Text(value)
                .font(.title2)
                .fontWeight(.bold)
        }
        .frame(width: 160, height: 160)

        .background {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.systemGray5))
                .shadow(radius: 10, x: 1, y: 10)
        }
    }
    
    private var portfolioBoxes: some View {
        HStack {
            grayBox(image: GrayBoxCases.netLoss.imageName, imageColor: GrayBoxCases.netLoss.imageColor, title: GrayBoxCases.netLoss.titleText, value: "-66.88%")
            
            Spacer()
            
            grayBox(image: GrayBoxCases.avaragePrice.imageName, imageColor: GrayBoxCases.avaragePrice.imageColor, title: GrayBoxCases.avaragePrice.titleText, value: "$61,331.11")
        }
        .padding(.top, 18)
    }
    
    private var transactionHeader: some View {
        HStack {
            Text("Transactions")
                .font(.title2)
                .fontWeight(.bold)
            Spacer()
            Button(action: {}, label: {
                Text("See All")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Image(systemName: "chevron.forward")
            })
            .foregroundStyle(.black)
            
        }
        .padding(.top)
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
    }
}



enum GrayBoxCases {
    case netLoss, netProfit, avaragePrice
    
    var imageName: String {
        switch self {
        case .netLoss:
            return "arrow.down.right.circle.fill"
        case .netProfit:
            return "arrow.up.right.circle.fill"
        case .avaragePrice:
            return "dollarsign.circle.fill"
        }
    }
    
    var imageColor: Color {
        switch self {
        case .netLoss:
            Color.red
        case .netProfit:
            Color.green
        case .avaragePrice:
            Color.blue
        }
    }
    
    var titleText: String {
        switch self {
        case .netLoss:
            "New Profit / Loss"
        case .netProfit:
            "New Profit / Loss"
        case .avaragePrice:
            "Average Price"
        }
    }
}



#Preview {
    NavigationStack {
        WalletCoinDetailView(coin: Coin.MOCK_COIN)
    }
}

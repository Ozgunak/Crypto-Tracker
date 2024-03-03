//
//  BuySellView.swift
//  BTCPrices
//
//  Created by özgün aksoy on 2024-02-17.
//

import SwiftUI

struct BuySellView: View {
    @Environment(\.dismiss) var dismiss

    @State var actionState: BuySellState = .buy
    @State var amouth: Double?
    
    var totalAmount: Double {
        coin.currentPrice * (amouth ?? 0)
    }
    var coin: Coin
    var body: some View {
        VStack {
            topButtonsView
            
            usdPriceRowView
            
            amountRowView
            
            totalPriceRowView
            
            Spacer()
            
            orderButtonView
            
            
        }
        .padding()
    }
    
    private var topButtonsView: some View {
        HStack {
            HStack(spacing: 0) {
                Button(action: {
                    actionState = .buy
                }, label: {
                    buyButtonView(action: .buy, selected: actionState == .buy)
                })
                Button(action: {
                    actionState = .sell
                }, label: {
                    buyButtonView(action: .sell, selected: actionState == .sell)
                })
            }
            
            Spacer()
            
            Button(action: {dismiss()}, label: {
                Image(systemName: "xmark.circle.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundStyle(.gray)
            })
                
        }
        .padding(4)
        .padding(.bottom, 24)
    }
    
    private var usdPriceRowView: some View {
        HStack {
            Text("Buy Price")
                .font(.headline)
            Spacer()
            Text(coin.currentPrice.toCurrency())
                .multilineTextAlignment(.trailing)
                .font(.title2)
            Text("USD")
                .font(.headline)
        }
    }
    
    private var amountRowView: some View {
        HStack {
            Text("Amount")
                .font(.headline)
            Spacer()
            TextField("0", value: $amouth, format: .number)
                .multilineTextAlignment(.trailing)
                .keyboardType(.numberPad)

                .font(.title2)
            Text(coin.symbol.uppercased())
                .font(.headline)
        }
    }
    
    private var totalPriceRowView: some View {
        HStack {
            Text("Total")
                .font(.title2)
            Spacer()
            Text(totalAmount.toCurrency())
                .multilineTextAlignment(.trailing)
                .font(.title2)
            Text("USD")
                .font(.headline)
        }
        .padding(.vertical, 20)
    }
    
    private var orderButtonView: some View {
        Button(action: {}, label: {
            Text(actionState.buttonTitle)
                .font(.title2)
                .foregroundStyle(.white)
                .padding()
                .frame(width: 270, height: 80)
                .background {
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill((amouth ?? 0) <= 0 ? .gray : actionState == .buy ? .green : .red)
                }
        })
    }
}

struct buyButtonView: View {
    var action: BuySellState
    var selected: Bool
    var body: some View {
        Text(action.rawValue.capitalized)
            .font(.title3)
            .fontWeight(selected ? .bold : .regular)
            .padding()
            .foregroundStyle((action == .buy && selected) ? .green : (action == .sell && selected) ? .red : .white)
            .frame(height: 40)
            .background {
                UnevenRoundedRectangle(topLeadingRadius: action.topBotLeading,
                                       bottomLeadingRadius: action.topBotLeading,
                                       bottomTrailingRadius: action.topBotTrailing,
                                       topTrailingRadius: action.topBotTrailing,
                                       style: .circular)
                    .fill(.gray)
            }
    }
}

#Preview {
    BuySellView(coin: .MOCK_COIN)
}

enum BuySellState: String {
    case buy, sell
    
    var topBotLeading: CGFloat {
        switch self {
        case .buy:
            20
        case .sell:
            0
        }
    }
    
    var topBotTrailing: CGFloat {
        switch self {
        case .buy:
            0
        case .sell:
            20
        }
    }
    
    var buttonTitle: String {
        switch self {
        case .buy:
            "Submit Buy Order"
        case .sell:
            "Submit Sell Order"
        }
    }
}

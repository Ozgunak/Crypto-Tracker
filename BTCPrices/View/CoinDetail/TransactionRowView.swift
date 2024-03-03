//
//  TransactionRowView.swift
//  BTCPrices
//
//  Created by özgün aksoy on 2024-02-14.
//

import SwiftUI

struct TransactionRowView: View {
    var transactionRowCase: TransactionRowCases = .buy
    
    var body: some View {
        HStack {
            Image(systemName: transactionRowCase.imageText)
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundStyle(.blue)
            
            VStack(alignment: .leading) {
                Text(transactionRowCase.text)
                    .font(.headline)
                Text("Jan 12")
                    .font(.subheadline)
            }
            .padding(.leading, 6)
            Spacer()
            VStack(alignment: .trailing) {
                Text("$750.24")
                    .font(.headline)
                HStack {
                    Text("+0.01")
                    Text("BTC")
                }
                .font(.subheadline)
                .foregroundStyle(transactionRowCase.color)
            }
            .padding(.bottom)
        }
    }
}

enum TransactionRowCases {
    case buy, sell
    
    var imageText: String {
        switch self {
        case .buy:
            "arrowshape.down.circle.fill"
        case .sell:
            "arrowshape.up.circle.fill"
        }
    }
    
    var text: String {
        switch self {
        case .buy:
            "Buy"
        case .sell:
            "Sell"
        }
    }
    
    var color: Color {
        switch self {
        case .buy:
                .green
        case .sell:
                .red
        }
    }
}

#Preview {
    TransactionRowView()
}

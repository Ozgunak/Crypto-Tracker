//
//  PortfolioPreview.swift
//  BTCPrices
//
//  Created by özgün aksoy on 2024-02-17.
//

import SwiftUI

struct PortfolioPreview: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Portfolio")
                .font(.title2)
                .fontWeight(.semibold)
            
            HStack {
                VStack(alignment: .leading, spacing: 12) {
                    Text("$2,945.19")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text("Your current balance")
                        .font(.subheadline)
                }
                Spacer()
                VStack(alignment: .center, spacing: 12) {
                    Text("-8.60%")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text("Today")
                        .font(.subheadline)
                }
                
            }
        }
        .padding()
        .padding(.vertical, 4)
        .foregroundStyle(.white)
        .background {
            RoundedRectangle(cornerRadius: 6)
                .fill(LinearGradient(colors: [.purple, .blue], startPoint: .leading, endPoint: .bottomTrailing))
                .shadow(color: .gray, radius: 10)
        }
    }
}

#Preview {
    PortfolioPreview()
}

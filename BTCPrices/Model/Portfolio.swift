//
//  Portfolio.swift
//  BTCPrices
//
//  Created by özgün aksoy on 2024-02-12.
//

import Foundation
import SwiftData

@Model
final class Portfolio {
    var totalHoldings: Double
    var avaliableCash: Double
    var investments: Double
    var coins: [Coin: Double]
    
    init(totalHoldings: Double, avaliableCash: Double, investments: Double, coins: [Coin : Double]) {
        self.totalHoldings = totalHoldings
        self.avaliableCash = avaliableCash
        self.investments = investments
        self.coins = coins
    }
}

//
//  History.swift
//  BTCPrices
//
//  Created by özgün aksoy on 2024-02-12.
//

import Foundation
import SwiftData

@Model
final class History {
    var coin: Coin
//    var actionType: ActionType
    var amount: Double
    var price: Double
    var time: Date
    var usdValue: Double
    
    init(coin: Coin, amount: Double, price: Double, time: Date, usdValue: Double) {
        self.coin = coin
//        self.actionType = actionType
        self.amount = amount
        self.price = price
        self.time = time
        self.usdValue = usdValue
    }
}

enum ActionType{
    case buy, sell
}


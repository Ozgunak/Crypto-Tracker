//
//  ChartItem.swift
//  BTCPrices
//
//  Created by özgün aksoy on 2024-02-14.
//

import Foundation

struct ChartItem: Codable {
    let prices: [[Double]]
    let marketCaps, totalVolumes: [[Double]]

    enum CodingKeys: String, CodingKey {
        case prices
        case marketCaps = "market_caps"
        case totalVolumes = "total_volumes"
    }
}

struct Price: Identifiable, Hashable {
    var id = UUID().uuidString
    var date: Date
    var price: Double
    
    init(timeSince1970: Double, price: Double) {
        self.date = Date(timeIntervalSince1970: timeSince1970)
        self.price = price
    }
}

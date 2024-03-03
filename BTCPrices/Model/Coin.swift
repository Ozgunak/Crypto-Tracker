//
//  Coin.swift
//  BTCPrices
//
//  Created by özgün aksoy on 2024-02-11.
//

import Foundation

struct Coin: Codable, Identifiable, Hashable {
    let id, symbol, name: String
    let image: String
    let currentPrice: Double
    let marketCap, marketCapRank, fullyDilutedValuation: Double?
    let totalVolume, high24H, low24H: Double?
    let priceChange24H, priceChangePercentage24H: Double?
    let marketCapChange24H: Double?
    let marketCapChangePercentage24H: Double?
    let circulatingSupply, totalSupply, maxSupply, ath: Double?
    let athChangePercentage: Double?
    let athDate: String?
    let atl, atlChangePercentage: Double?
    let atlDate: String?
    let lastUpdated: String?

    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case fullyDilutedValuation = "fully_diluted_valuation"
        case totalVolume = "total_volume"
        case high24H = "high_24h"
        case low24H = "low_24h"
        case priceChange24H = "price_change_24h"
        case priceChangePercentage24H = "price_change_percentage_24h"
        case marketCapChange24H = "market_cap_change_24h"
        case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
        case ath
        case athChangePercentage = "ath_change_percentage"
        case athDate = "ath_date"
        case atl
        case atlChangePercentage = "atl_change_percentage"
        case atlDate = "atl_date"
        case lastUpdated = "last_updated"
    }
    
    static let MOCK_COIN: Coin = Coin(id: "bitcoin", symbol: "btc", name: "Bitcoin", image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400", currentPrice: 48158.0, marketCap: (944227780177.0), marketCapRank: (1.0), fullyDilutedValuation: (1010378718260.0), totalVolume: (20666050455.0), high24H: (48487.0), low24H: (47624.0), priceChange24H: (244.57), priceChangePercentage24H: (0.51044), marketCapChange24H: (3318612033.0), marketCapChangePercentage24H: (0.3527), circulatingSupply: (19625100.0), totalSupply: (21000000.0), maxSupply: (21000000.0), ath: (69045.0), athChangePercentage: (-30.31583), athDate: ("2021-11-10T14:24:11.849Z"), atl: (67.81), atlChangePercentage: (70854.10978), atlDate: ("2013-07-06T00:00:00.000Z"), lastUpdated: ("2024-02-11T22:03:00.726Z"))
}

//
//Coin(id: "bitcoin",
//                          symbol: "btc",
//                          name: "Bitcoin",
//                          image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
//                          currentPrice: 48327.0)
//// MARK: - Encode/decode helpers
//
//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
//    public var hashValue: Int {
//        return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}

//
//  HomeViewModel.swift
//  BTCPrices
//
//  Created by özgün aksoy on 2024-02-11.
//

import Foundation

@Observable
class HomeViewModel {
    
    @MainActor var coins = [Coin]()
    var moverCoins = [Coin]()
    var isLoading = false
    
    let BASE_URL = "https://api.coingecko.com/api/v3/coins/"
    let coinPerPage = 20
    var page = 0
    
    init() {
        Task {
            await getCoinsPrices()
        }
    }
    
    @MainActor
    func getCoinsPrices() async {
        do {
            page += 1
            let urlString = "\(BASE_URL)markets?vs_currency=usd&order=market_cap_desc&per_page=\(coinPerPage)&page=\(page)&sparkline=false&price_change_percentage=24h&locale=en"

            guard let url = URL(string: urlString) else { throw CoinError.invalidURL }
            isLoading = true
            
            let (data, response) = try await URLSession.shared.data(from: url)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw CoinError.serverError }
            guard let coinList = try? JSONDecoder().decode([Coin].self, from: data) else { throw CoinError.invalidData }
            
            coins.append(contentsOf: coinList)
//            self.coins = coinList
            let topCoins = coins.sorted(by: { $0.priceChangePercentage24H ?? 0 > $1.priceChangePercentage24H ?? 0})
            moverCoins = Array(topCoins.prefix(5))
            isLoading = false
            
            
        } catch {
            print("Debug: \(error.localizedDescription)")
        }
        
    }
}

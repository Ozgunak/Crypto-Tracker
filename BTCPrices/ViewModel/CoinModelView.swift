//
//  CoinModelView.swift
//  BTCPrices
//
//  Created by özgün aksoy on 2024-02-16.
//

import Foundation

@Observable
class CoinModelView {
    var coinDetail: CoinDetail?
    
    func getCoinDetails(coin: Coin) {
            
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/bitcoin?localization=false&tickers=false&market_data=true&community_data=false&developer_data=false&sparkline=false") else { return }
        
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let error {
                print("Error: getting coin \(error.localizedDescription)")
                return
            }
            
            if let response = response as? HTTPURLResponse {
                print("coin detail response: \(response.statusCode)")
            }
            
            guard let data else { return }
        
            do {
                let coinDetailResult = try JSONDecoder().decode(CoinDetail.self, from: data)
                self.coinDetail = coinDetailResult
            } catch {
                print("Error: decode json detail \(error.localizedDescription)")
            }
            
        }.resume()
    }
}

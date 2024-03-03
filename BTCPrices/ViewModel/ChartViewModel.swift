//
//  ChartViewModel.swift
//  BTCPrices
//
//  Created by özgün aksoy on 2024-02-12.
//

import Foundation

@Observable
class ChartViewModel {
    var prices: [Price] = []
    var min: Double = 10000
    var max: Double = 50000
    
    func getChartData() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/bitcoin/market_chart?vs_currency=usd&days=90&interval=daily") else { return }
        
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let error {
                print("Error: chart data \(error.localizedDescription)")
            }
            if let response = response as? HTTPURLResponse {
                print("charts response: \(response.statusCode)")
            }
            
            if let data = data {
                do {
                    let chart = try JSONDecoder().decode(ChartItem.self, from: data)
                    let list: [Price] = chart.prices.map( { Price(timeSince1970: $0[0] / 1000, price: $0[1]) })
                    self.min = list.max(by: { $0.price > $1.price })?.price ?? 0
                    self.max = list.min(by: { $0.price > $1.price })?.price ?? 0
//                    print(self.min)
//                    print(self.max)
                    self.prices = list
//                    print(list)
                } catch {
                    print("Error: data charts \(error.localizedDescription)")
                }
            }
        }.resume()
    }
    
    func getPrices() {
        
    }
}


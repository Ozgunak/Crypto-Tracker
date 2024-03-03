//
//  BTCPricesApp.swift
//  BTCPrices
//
//  Created by özgün aksoy on 2024-02-08.
//

import SwiftUI
import SwiftData

@main
struct BTCPricesApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .modelContainer(for: [Portfolio.self, History.self])
        }
    }
}

//
//  DomainCoin.swift
//  CryptoRepoPackage
//
//  Created by Marcelo Mogrovejo on 02/12/2023.
//

import Foundation

public struct DomainCoin {
    public let id, symbol, name: String
    public let image: String
    public let currentPrice: Double
    public let priceChange24H, priceChangePercentage24H: Double
    public let marketCapRank: Double?

    public init(id: String,
                symbol: String,
                name: String,
                image: String,
                currentPrice: Double,
                priceChange24H: Double,
                priceChangePercentage24H: Double,
                marketCapRank: Double?) {
        self.id = id
        self.symbol = symbol
        self.name = name
        self.image = image
        self.currentPrice = currentPrice
        self.priceChange24H = priceChange24H
        self.priceChangePercentage24H = priceChangePercentage24H
        self.marketCapRank = marketCapRank
    }
}

//
//  CoinDetails.swift
//  CryptoCoin
//
//  Created by Ilfeld, Yehuda on 09/02/2023.
//


import Foundation


// MARK: - CoinDetails
struct CoinDetails: Decodable {
    let id, symbol, name: String
    let description: Description
    let image: Image
    let marketData: MarketData
    let lastUpdated: String
    
    enum CodingKeys: String, CodingKey {
        case id, symbol, name
        case description, image
        case marketData = "market_data"
        case lastUpdated = "last_updated"
    }
}

extension CoinDetails {
    var toMarketInfo: [MarketInfo] {
        [("Current Price", marketData.currentPrice),
         ("Market Cap", marketData.marketCap),
         ("Fully Diluted Valuation", marketData.fullyDilutedValuation),
         ("Total Volume", marketData.totalVolume),
         ("High 24 Hours", marketData.high24H),
         ("Low 24 Hours",  marketData.low24H)]
            .map { MarketInfo(title: $0.0, data: $0.1.toCoinValues) }
    }
    
}

// MARK: - Description
struct Description: Codable {
    let en: String
}

struct MarketInfo {
    let title: String
    let data: [CoinData]
}

// MARK: - MarketData
struct MarketData: Decodable {
    let currentPrice: [String: Double]
    let marketCap: [String: Double]
    let fullyDilutedValuation, totalVolume, high24H, low24H: [String: Double]
    
    enum CodingKeys: String, CodingKey {
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case fullyDilutedValuation = "fully_diluted_valuation"
        case totalVolume = "total_volume"
        case high24H = "high_24h"
        case low24H = "low_24h"
    }
}




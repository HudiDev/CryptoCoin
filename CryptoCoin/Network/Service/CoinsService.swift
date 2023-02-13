//
//  CoinsService.swift
//  CryptoCoin
//
//  Created by Ilfeld, Yehuda on 09/02/2023.
//

import Foundation


class CoinsService {
    static func getCoins() async throws -> [Coin] {
        let response = try await CoinsApi.coins.request([Coin].self)
        return response
    }
    
    static func getCoinDetails(coin: Coin) async throws -> CoinDetails {
        let response = try await CoinsApi.coinDetails(coin.id).request(CoinDetails.self)
        return response
    }
    
}

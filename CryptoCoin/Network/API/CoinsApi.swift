//
//  CoinsApi.swift
//  CryptoCoin
//
//  Created by Ilfeld, Yehuda on 09/02/2023.
//

import Foundation


enum CoinsApi: Api {
    case coins
    case coinDetails(_ coin: String)
}

extension CoinsApi {
    var path: String {
        switch self {
        case .coins:
            return "/coins"
        case .coinDetails(let coin):
            return "/coins/\(coin)"
        }
    }
    
    var method: HttpMethod {
        switch self {
        case .coins, .coinDetails:
            return .get
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var body: Data? {
        return nil
    }
}

extension CoinsApi {
    struct CoinsResponse: Decodable {
        let coins: [Coin]
    }
}

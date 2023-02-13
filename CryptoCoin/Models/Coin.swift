//
//  Coin.swift
//  CryptoCoin
//
//  Created by Ilfeld, Yehuda on 09/02/2023.
//

import Foundation


struct Coin: Decodable {
    let id, symbol, name: String
    let image: Image
}



// MARK: - Image
struct Image: Decodable {
    let thumb, small, large: String
}


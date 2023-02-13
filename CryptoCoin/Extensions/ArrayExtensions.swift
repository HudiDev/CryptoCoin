//
//  ArrayExtensions.swift
//  CryptoCoin
//
//  Created by Ilfeld, Yehuda on 12/02/2023.
//

import Foundation


extension Array {
    func chunked(into size: Int) -> [[Element]] {
        var ranges = stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
        if let lastRange = ranges.last, lastRange.count <= 1 {
            ranges[ranges.count - 2].append(contentsOf: lastRange)
            ranges.remove(at: ranges.count - 1)
        }
        return ranges
    }
}


extension Array where Element == CoinData {
    var rangeDescription: String {
        return "\(first?.coin ?? "") - \(last?.coin ?? "")"
    }
}

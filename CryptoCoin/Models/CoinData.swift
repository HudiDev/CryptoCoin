//
//  CoinValue.swift
//  CryptoCoin
//
//  Created by Ilfeld, Yehuda on 09/02/2023.
//

import Foundation
import Charts


struct CoinData {
    let index: Int
    let coin: String
    let value: Double
    
    func transformToBarChartDataEntry() -> BarChartDataEntry {
        let entry = BarChartDataEntry(x: Double(index), y: value)
        return entry
    }
}

extension Dictionary where Key == String, Value == Double {
    var toCoinValues: [CoinData] {
        self.enumerated().map {
            CoinData(index: $0.offset, coin: $0.element.key, value: $0.element.value.roundTo(places: 3))
        }
    }
}

extension Array where Element == CoinData {
    var highestValue: Double {
        self.max { $0.value < $1.value }?.value ?? 0
    }
}

extension Double {
    func roundTo(places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

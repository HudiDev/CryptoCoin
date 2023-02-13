//
//  ChartViewModel.swift
//  CryptoCoin
//
//  Created by Ilfeld, Yehuda on 13/02/2023.
//

import Foundation
import Charts


class ChartViewModel: ViewModel {
    
    var marketInfo: MarketInfo
    var data: Observable<[BarChartDataEntry]> = .init([])
    var items: [CoinData] = []
    
    var coinMinimum: Double {
        self.items.min { $0.value < $1.value }?.value ?? 0
    }
    
    var coinMaximum: Double {
        (self.items.max { $0.value < $1.value }?.value ?? 0) * 1.2
    }
    
    init(marketInfo: MarketInfo) {
        self.marketInfo = marketInfo
    }
    
    func getData() {
        self.items = self.marketInfo.data.enumerated().map { CoinData(index: $0.offset, coin: $0.element.coin, value: $0.element.value)}
        self.data.value = self.items.map{ $0.transformToBarChartDataEntry() }
    }

}

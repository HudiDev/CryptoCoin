//
//  DetailsViewModel.swift
//  CryptoCoin
//
//  Created by Ilfeld, Yehuda on 13/02/2023.
//

import Foundation


class DetailsViewModel: ViewModel {
    
    var data: Observable<[MarketInfo]> = .init([])
    var description: Observable<String> = .init("")
    var coin: Coin?
    
    func getData() {
        guard let coin = self.coin else { return }
        Task(priority: .userInitiated) {
            do {
                let coinDetails = try await CoinsService.getCoinDetails(coin: coin)
                self.data.value = coinDetails.toMarketInfo
                self.description.value = coinDetails.description.en
            } catch let error {
                self.data.error = error
            }
        }
    }
}

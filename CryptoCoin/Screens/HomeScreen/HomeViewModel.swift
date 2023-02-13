//
//  HomeViewModel.swift
//  CryptoCoin
//
//  Created by Ilfeld, Yehuda on 12/02/2023.
//

import UIKit


class HomeViewModel: ViewModel {
    
    var data: Observable<[Coin]> = .init([])
    
    func getData() {
        Task(priority: .userInitiated) {
            do {
                self.data.value = try await CoinsService.getCoins()
            } catch let error {
                self.data.error = error
            }
        }
    }
    
}

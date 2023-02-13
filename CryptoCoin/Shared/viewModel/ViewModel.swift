//
//  ViewModel.swift
//  CryptoCoin
//
//  Created by Ilfeld, Yehuda on 13/02/2023.
//

import Foundation


protocol ViewModel {
    associatedtype DataType
    var data: Observable<DataType> { get }
    func getData()
}

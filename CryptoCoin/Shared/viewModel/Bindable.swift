//
//  Bindable.swift
//  CryptoCoin
//
//  Created by Ilfeld, Yehuda on 13/02/2023.
//

import Foundation


protocol Bindable {
    associatedtype T: ViewModel
    var viewModel: T { get }
    func bindViewModel()
}


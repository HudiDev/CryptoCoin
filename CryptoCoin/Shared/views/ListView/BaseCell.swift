//
//  BaseCollectionViewCell.swift
//  CryptoCoin
//
//  Created by Ilfeld, Yehuda on 12/02/2023.
//

import UIKit


protocol BaseCell {
    associatedtype Data
    static var identifier: String { get }
    func setup(item: Data)
}

extension BaseCell {
    static var identifier: String {
        String(describing: Self.self)
    }
}

//
//  ListView.swift
//  CryptoCoin
//
//  Created by Ilfeld, Yehuda on 13/02/2023.
//

import Foundation


protocol ListView {
    associatedtype Data
    associatedtype Cell
    var items: [Data] { get }
    var cell: Cell.Type { get }
    var didSelect: DidSelect<Data>? { get }
}

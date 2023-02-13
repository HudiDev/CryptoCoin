//
//  BaseCollectionView.swift
//  CryptoCoin
//
//  Created by Ilfeld, Yehuda on 12/02/2023.
//

import UIKit


typealias DidSelect<T> = (_ item: T) -> Void


class BaseCollectionView<Data, Cell: UICollectionViewCell>: UICollectionView where Cell: BaseCell, Cell.Data == Data  {
    
    var items: [Data] {
        didSet { self.collectionViewManager.items = items }
    }
    
    var collectionViewManager: CollectionViewManager<Data, Cell>
    
    init(items: [Data], cell: Cell.Type, layout: UICollectionViewLayout, didSelect: DidSelect<Data>?) {
        self.items = items
        self.collectionViewManager = CollectionViewManager(items: items, cell: cell, didSelect: didSelect)
        
        super.init(frame: .zero, collectionViewLayout: layout)
        
        self.delegate = self.collectionViewManager
        self.dataSource = self.collectionViewManager
        self.register(cell, forCellWithReuseIdentifier: cell.identifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

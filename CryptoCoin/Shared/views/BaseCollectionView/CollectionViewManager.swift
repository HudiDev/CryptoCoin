//
//  CollectionViewManager.swift
//  CryptoCoin
//
//  Created by Ilfeld, Yehuda on 12/02/2023.
//

import UIKit


class CollectionViewManager<Data, Cell: UICollectionViewCell>: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, ListView where Cell: BaseCell, Cell.Data == Data {
    
    var items: [Data]
    let cell: Cell.Type
    var didSelect: DidSelect<Data>?
    
    init(items: [Data], cell: Cell.Type, didSelect: DidSelect<Data>?) {
        self.items = items
        self.cell = cell
        self.didSelect = didSelect
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.identifier, for: indexPath) as? Cell else { return UICollectionViewCell() }
        cell.setup(item: self.items[indexPath.item])
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.didSelect?(self.items[indexPath.item])
    }
}

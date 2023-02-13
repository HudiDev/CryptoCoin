//
//  GridBoxCollectionView.swift
//  CryptoCoin
//
//  Created by Ilfeld, Yehuda on 12/02/2023.
//

import UIKit


class GridBoxCollectionView<Data, Cell: UICollectionViewCell>: BaseCollectionView<Data, Cell> where Cell: BaseCell, Cell.Data == Data {
        
    init(items: [Data], cell: Cell.Type, itemSize: CGSize, didSelect: DidSelect<Data>?) {
        super.init(items: items, cell: cell, layout: UICollectionViewLayout(), didSelect: didSelect)
        self.collectionViewLayout = setGridBoxLayout(itemSize: itemSize)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setGridBoxLayout(itemSize: CGSize) -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        layout.itemSize = itemSize
        return layout
    }
    
}

//
//  RangesVC.swift
//  CryptoCoin
//
//  Created by Ilfeld, Yehuda on 11/02/2023.
//

import UIKit


class RangesVC: BaseViewController {
    
    var coinRanges = CoinRanges(title: "", ranges: [[CoinData]]())
    
    func didSelect(_ range: [CoinData]) {
        let chartVC = ChartVC()
        chartVC.marketInfo = MarketInfo(title: self.coinRanges.title, data: range)
        self.navigationController?.pushViewController(chartVC, animated: true)
    }
    
    lazy var collectionView: GridBoxCollectionView<[CoinData], RangeCell> = {
        let viewSize = self.view.frame.size
        let collectionView = GridBoxCollectionView(
            items: [[CoinData]](),
            cell: RangeCell.self,
            itemSize: CGSize(width: (viewSize.width / 3) - 1, height: (viewSize.height / 10) - 10),
            didSelect: self.didSelect)
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.coinRanges.title
        self.collectionView.items = self.coinRanges.ranges
        self.setupCollectionView()
    }
    
    func setupCollectionView() {
        self.view.addSubview(self.collectionView)
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 64).isActive = true
        self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
    }

}

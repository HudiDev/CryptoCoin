//
//  HomeView.swift
//  CryptoCoin
//
//  Created by Ilfeld, Yehuda on 12/02/2023.
//

import UIKit


class HomeView: UIView {
    
    var didSelect: DidSelect<Coin>?
    
    lazy var header: UILabel = {
        let label = UILabel()
        label.text = "Welcome"
        label.font = label.font.withSize(30)
        return label
    }()
    
    lazy var collectionView: GridBoxCollectionView<Coin, CoinCell> = {
        let viewSize = self.frame.size
        let collectionView = GridBoxCollectionView(
            items: [Coin](),
            cell: CoinCell.self,
            itemSize: CGSize(width: (viewSize.width / 3) - 1, height: (viewSize.height / 10) - 10),
            didSelect: self.didSelect)
        return collectionView
    }()
    
    init(didSelect: DidSelect<Coin>?) {
        self.didSelect = didSelect
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.setupView()
    }
    
    private func setupView() {
        self.setupHeader()
        self.setupCollectionView()
    }
    
    private func setupHeader() {
        self.addSubview(self.header)
        self.header.translatesAutoresizingMaskIntoConstraints = false
        self.header.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        self.header.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    private func setupCollectionView() {
        self.addSubview(self.collectionView)
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.collectionView.topAnchor.constraint(equalTo: self.header.bottomAnchor, constant: 16).isActive = true
        self.collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.collectionView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        self.collectionView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
    }
}

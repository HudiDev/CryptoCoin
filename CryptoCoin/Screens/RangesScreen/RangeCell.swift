//
//  RangeCell.swift
//  CryptoCoin
//
//  Created by Ilfeld, Yehuda on 11/02/2023.
//

import UIKit


class RangeCell: UICollectionViewCell, BaseCell {
    
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Hello Man"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.contentView.layer.borderWidth = 0.5
        self.contentView.layer.borderColor = UIColor.black.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setupLabel()
    }
    
    func setup(item: [CoinData]) {
        self.label.text = item.rangeDescription
    }
    
    func setupLabel() {
        self.contentView.addSubview(self.label)
        self.label.translatesAutoresizingMaskIntoConstraints = false
        self.label.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        self.label.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
    }
    
}

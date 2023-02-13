//
//  CoinCell.swift
//  CryptoCoin
//
//  Created by Ilfeld, Yehuda on 09/02/2023.
//

import UIKit
import SDWebImage


class CoinCell: UICollectionViewCell, BaseCell {
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = label.font.withSize(15)
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
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
        self.setupStackView()
        self.setupImageView()
        
    }
    
    func setup(item: Coin) {
        self.imageView.sd_setImage(with: URL(string: item.image.large), placeholderImage: UIImage(systemName: "bitcoinsign.circle"))
        self.label.text = item.name
    }

    private func setupStackView() {
        self.contentView.addSubview(self.stackView)
        self.stackView.addArrangedSubview(self.imageView)
        self.stackView.addArrangedSubview(self.label)
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5).isActive = true
        self.stackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        self.stackView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor).isActive = true
        self.stackView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor).isActive = true
    }
    
    private func setupImageView() {
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        self.imageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}

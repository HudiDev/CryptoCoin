//
//  DetailsView.swift
//  CryptoCoin
//
//  Created by Ilfeld, Yehuda on 13/02/2023.
//

import UIKit


class DetailsView: UIView {
    
    var didSelect: DidSelect<MarketInfo>?
    var didExpand: DidSelect<String>?
    
    lazy var topStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 32
        return stackView
    }()
    
    lazy var bottomStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(30)
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var expandBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Tap to expand", for: .normal)
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.addTarget(self, action: #selector(onExpandTap), for: .touchDown)
        return btn
    }()
    
    @objc func onExpandTap() {
        guard let descriptionText = self.descriptionLabel.text else { return }
        self.didExpand?(descriptionText)
    }
    
    lazy var detailsTableView: BaseTableView<MarketInfo, MarketInfoCell> = {
        let tableView = BaseTableView(items: [MarketInfo](), cell: MarketInfoCell.self, didSelect: self.didSelect)
        return tableView
    }()
    
    init(headerTitle: String?, didSelect: DidSelect<MarketInfo>?, didExpand: DidSelect<String>?) {
        super.init(frame: .zero)
        self.headerLabel.text = "\(headerTitle ?? "") Details"
        self.didSelect = didSelect
        self.didExpand = didExpand
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.setupView()
    }
    
    func setupView() {
        self.addSubview(self.headerLabel)
        self.setupTopStackView()
        self.setupBottomStackView()
        self.setupTableView()
    }
    
    func setupTopStackView() {
        self.addSubview(self.topStackView)
        self.topStackView.addArrangedSubview(self.headerLabel)
        
        self.topStackView.translatesAutoresizingMaskIntoConstraints = false
        self.topStackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32).isActive = true
        self.topStackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        self.topStackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
    }
    
    func setupBottomStackView() {
        self.topStackView.addArrangedSubview(self.bottomStackView)
        self.bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        self.descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        self.expandBtn.translatesAutoresizingMaskIntoConstraints = false
        self.bottomStackView.addArrangedSubview(self.descriptionLabel)
        self.bottomStackView.addArrangedSubview(self.expandBtn)
        self.descriptionLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
        self.expandBtn.topAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor, constant: -20).isActive = true
        self.expandBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupTableView() {
        self.addSubview(self.detailsTableView)
        self.detailsTableView.translatesAutoresizingMaskIntoConstraints = false
        self.detailsTableView.topAnchor.constraint(equalTo: self.topStackView.bottomAnchor, constant: 32).isActive = true
        self.detailsTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.detailsTableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        self.detailsTableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
}

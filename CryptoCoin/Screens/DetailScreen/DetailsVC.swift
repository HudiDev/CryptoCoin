//
//  DetailsVC.swift
//  CryptoCoin
//
//  Created by Ilfeld, Yehuda on 09/02/2023.
//

import UIKit

class DetailsVC: BaseViewController, Bindable {
    
    var viewModel = DetailsViewModel()
    
    var coinDetails: CoinDetails?
    var coin: Coin?
    var detailsData = [MarketInfo]()
    var detailsView: DetailsView?
    
    func didSelect(marketInfo: MarketInfo) {
        let rangesVC = RangesVC()
        let ranges = marketInfo.data.chunked(into: 10)
        rangesVC.coinRanges = CoinRanges(title: marketInfo.title, ranges: ranges)
        self.navigationController?.pushViewController(rangesVC, animated: true)
    }
    
    func didExpand(description: String) {
        let descriptionVC = DescriptionVC()
        descriptionVC.modalPresentationStyle = .pageSheet
        descriptionVC.textView.text = description
        self.present(descriptionVC, animated: true)
    }
    
    override func loadView() {
        self.detailsView = DetailsView(headerTitle: self.coin?.name, didSelect: didSelect, didExpand: didExpand)
        self.view = self.detailsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.coin?.name ?? ""
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if self.isBeingPresented || self.isMovingToParent {
            self.showSpinnerView()
            self.bindViewModel()
            self.viewModel.coin = self.coin
            self.viewModel.getData()
        }
    }
    
    func bindViewModel() {
        self.viewModel.data.valueChanged = { [weak self] marketInfo in
            DispatchQueue.main.async {
                guard let self = self else { return }
                self.removeSpinnerView()
                self.detailsView?.detailsTableView.items = marketInfo
                self.detailsView?.detailsTableView.reloadData()
            }
        }
        
        self.viewModel.description.valueChanged = { [weak self] description in
            DispatchQueue.main.async {
                guard let self = self else { return }
                self.removeSpinnerView()
                self.detailsView?.descriptionLabel.text = description
            }
        }
        
        self.viewModel.data.errorOcurred = { [weak self] error in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.displayAlert(with: error.localizedDescription)
            }
        }
    }
}


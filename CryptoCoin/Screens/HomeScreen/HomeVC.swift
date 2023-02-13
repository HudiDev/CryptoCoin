//
//  HomeVC.swift
//  CryptoCoin
//
//  Created by Ilfeld, Yehuda on 08/02/2023.
//

import UIKit


class HomeVC: BaseViewController, Bindable {
    
    var homeView: HomeView?
    var viewModel = HomeViewModel()
    
    func didSelect(_ coin: Coin) {
        let detailsVC = DetailsVC()
        detailsVC.coin = coin
        self.navigationController?.pushViewController(detailsVC, animated: true)
    }
    
    override func loadView() {
        self.homeView = HomeView(didSelect: didSelect)
        self.view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "CryptoCoin"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if self.isBeingPresented || self.isMovingToParent {
            self.showSpinnerView()
            self.bindViewModel()
            self.viewModel.getData()
        }
    }
    
    func bindViewModel() {
        self.viewModel.data.valueChanged = { [weak self] coins in
            guard let self = self, let homeView = self.homeView else { return }
            self.removeSpinnerView()
            DispatchQueue.main.async {
                homeView.collectionView.items = coins
                homeView.collectionView.reloadData()
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

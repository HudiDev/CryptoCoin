//
//  BaseViewController.swift
//  CryptoCoin
//
//  Created by Ilfeld, Yehuda on 12/02/2023.
//

import UIKit


class BaseViewController: UIViewController {
    
    var spinnerView: SpinnerViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
    
    func showSpinnerView() {
        self.spinnerView = SpinnerViewController()

        // add the spinner view controller
        addChild(self.spinnerView!)
        self.spinnerView!.view.frame = view.frame
        view.addSubview(self.spinnerView!.view)
        self.spinnerView!.didMove(toParent: self)
    }
    
    func removeSpinnerView() {
        guard let spinnerView = self.spinnerView else { return }
        DispatchQueue.main.async {
            spinnerView.willMove(toParent: nil)
            spinnerView.view.removeFromSuperview()
            spinnerView.removeFromParent()
        }
    }
}

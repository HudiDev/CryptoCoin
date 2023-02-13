//
//  ViewControllerExtensions.swift
//  CryptoCoin
//
//  Created by Ilfeld, Yehuda on 13/02/2023.
//

import UIKit


extension UIViewController {
    func displayAlert(with message: String) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        self.present(alert, animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2){
          alert.dismiss(animated: true, completion: nil)
        }
    }
}

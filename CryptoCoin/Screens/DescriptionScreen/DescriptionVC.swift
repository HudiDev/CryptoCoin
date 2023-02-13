//
//  DescriptionVC.swift
//  CryptoCoin
//
//  Created by Ilfeld, Yehuda on 12/02/2023.
//

import UIKit


class DescriptionVC: UIViewController {
    
    lazy var textView: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setupLabel()
    }
    
    func setupLabel() {
        self.view.addSubview(self.textView)
        self.textView.translatesAutoresizingMaskIntoConstraints = false
        self.textView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 32).isActive = true
        self.textView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.textView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16).isActive = true
        self.textView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16).isActive = true
    }
    
}

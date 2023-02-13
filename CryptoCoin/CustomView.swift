//
//  CustomView.swift
//  CryptoCoin
//
//  Created by Ilfeld, Yehuda on 10/02/2023.
//

import UIKit

class CustomView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = UIColor.green
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)

        let bottomRect = CGRect(
            origin: CGPoint(x: rect.origin.x, y: rect.midY - (rect.size.height / 3) / 2),
            size: CGSize(width: rect.size.width / 2, height: rect.size.height / 3)
        )
        UIColor.red.set()
        UIRectFill(bottomRect)
    }

}

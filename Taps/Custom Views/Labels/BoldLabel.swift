//
//  BoldLabel.swift
//  Taps
//
//  Created by Liana Haque on 2/7/21.
//

import UIKit

class BoldLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    private func configure() {
        translatesAutoresizingMaskIntoConstraints   = false
        textColor                                   = .black
        numberOfLines                               = 0
        font                                        = .systemFont(ofSize: 25, weight: .heavy)
        adjustsFontSizeToFitWidth                   = true
        minimumScaleFactor                          = 0.25
        adjustsFontForContentSizeCategory           = true
    }
}

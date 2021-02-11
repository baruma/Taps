//
//  BreweryInformationView.swift
//  Taps
//
//  Created by Liana Haque on 2/10/21.
//

import UIKit

class BreweryInformationView: UIView {

    override init(frame: CGRect) {
            super.init(frame: frame)
            configure()
        }

        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            configure()
        }

        func configure() {
            let bundle = Bundle.init(for: BreweryInformationView.self)
            if let viewsToAdd = bundle.loadNibNamed("BreweryInformationView", owner: self, options: nil), let contentView = viewsToAdd.first as? UIView {
                addSubview(contentView)
                translatesAutoresizingMaskIntoConstraints = false
                
                contentView.frame = self.bounds
                contentView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
            }
        }
}

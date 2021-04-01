//
//  BreweryInformationCell.swift
//  Taps
//
//  Created by Liana Haque on 3/30/21.
//

import UIKit

class BreweryInformationCell: UITableViewCell {
     static let reuseID = "BreweryInformationCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    private func configure() {
        let bundle = Bundle.init(for: BreweryInformationCell.self)
        
//        if let viewsToAdd = bundle.loadNibNamed("BreweryInformationCell", owner: self, options: nil), let contentView = viewsToAdd.first as? UITableViewCell {
//            addSubview(contentView)
//            translatesAutoresizingMaskIntoConstraints = false
//            
//            contentView.frame = self.bounds
//            contentView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
//        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

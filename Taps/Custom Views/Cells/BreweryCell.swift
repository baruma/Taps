//
//  BreweryCell.swift
//  Taps
//
//  Created by Liana Haque on 2/7/21.
//

import UIKit

class BreweryCell: UITableViewCell {
    static let reuseID = "BreweryCell"
    
    // UI Components of Cell
    let boldBreweryNameLabel    = BoldLabel()
    let subtitleCityLabel       = SubtitleLabel()
    let subtitleStateLabel      = SubtitleLabel()
    let verticalStackView       = UIStackView()
    let horizontalStackView     = UIStackView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    private func configure() {
        
        // Horizontal StackView Configuration- holds City and State Labels
        horizontalStackView.addArrangedSubview(subtitleCityLabel)
        horizontalStackView.addArrangedSubview(subtitleStateLabel)
        
        horizontalStackView.translatesAutoresizingMaskIntoConstraints   = false
        horizontalStackView.axis                                        = .horizontal
        horizontalStackView.alignment                                   = .trailing
        horizontalStackView.spacing                                     = 1.0
        
        // Vertical StackView Configuration - holds horizontal stackview and brewery name
        verticalStackView.addArrangedSubview(boldBreweryNameLabel)
        verticalStackView.addArrangedSubview(horizontalStackView)
        
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.axis                                      = .vertical
        verticalStackView.distribution                              = .fillProportionally
        verticalStackView.spacing                                   = 5.0
        
        // Cell Configuration
        addSubview(verticalStackView)
        translatesAutoresizingMaskIntoConstraints                   = false
        layer.cornerRadius                                          = 20
        
        contentView.addSubview(verticalStackView)
        translatesAutoresizingMaskIntoConstraints = false
        
         let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
            verticalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            verticalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            verticalStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            verticalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
        ])
    }

}

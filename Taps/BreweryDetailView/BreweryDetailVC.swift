//
//  BreweryDetailVCViewController.swift
//  Taps
//
//  Created by Liana Haque on 2/10/21.
//

import UIKit

class BreweryDetailVC: UIViewController {
    public var brewery: Brewery? = nil
    
    static let id = "BreweryInformationVC"
    let breweryInformationView = BreweryInformationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configure()
    }
    
    func configure() {
        view.addSubview(breweryInformationView)
        
        breweryInformationView.breweryLabelOutlet.text = brewery?.name
        breweryInformationView.cityLabelOutlet.text = brewery?.city
        breweryInformationView.stateLabelOutlet.text = brewery?.state
        breweryInformationView.websiteLabelOutlet.text = brewery?.website
        /// TODO: - Beware of the force unwrap below.  See if there are alternatiaves to what you are doing here.
        breweryInformationView.phoneLabelOutlet.text = String(brewery!.phone)
        
        NSLayoutConstraint.activate([
            breweryInformationView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor),
            breweryInformationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            breweryInformationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            breweryInformationView.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
}


// need to change this whole thing to a tableview... ugh.

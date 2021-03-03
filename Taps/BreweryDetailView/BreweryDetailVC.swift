//
//  BreweryDetailVCViewController.swift
//  Taps
//
//  Created by Liana Haque on 2/10/21.
//

import UIKit

class BreweryDetailVC: UIViewController {
    static let id = "BreweryInformationVC"
    let breweryInformationView = BreweryInformationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureblah()
    }
    
    func configureblah() {
        view.addSubview(breweryInformationView)
        
        NSLayoutConstraint.activate([
            breweryInformationView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor),
            breweryInformationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            breweryInformationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            breweryInformationView.heightAnchor.constraint(equalToConstant: 250)

        ])
    }
}

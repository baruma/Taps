//
//  BreweryDetailVCViewController.swift
//  Taps
//
//  Created by Liana Haque on 2/10/21.
//

import UIKit

class BreweryDetailTableVC: UIViewController {
    static let id = "BreweryDetailTableVC"
    public var brewery: Brewery? = nil
    private var tableView = UITableView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    private enum Section {
        case information
        case starRating
        case generalNotes
        case BeerNotes // think about this one more...
        case photoList
    }
    
    private func configureTableView() {
        view.addSubview(self.tableView)
        tableView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        tableView.delegate = self
        tableView.dataSource = self

       // tableView.register(BreweryInformationCell.self, forCellReuseIdentifier: BreweryInformationCell.reuseID)
        //tableView.register(BreweryInformationCell.self, forCellWithReuseIdentifier: BreweryInformationCell.reuseID)

        let informationCell = UINib(nibName: BreweryInformationCell.reuseID, bundle: Bundle.main)
        tableView.register(informationCell, forCellReuseIdentifier: BreweryInformationCell.reuseID)
        
        let starRatingCell = UINib(nibName: "StarRatingCell", bundle: Bundle.main)
        tableView.register(starRatingCell, forCellReuseIdentifier: StarRatingCell.reuseID)
    
        tableView.autoresizingMask = [.flexibleHeight, .flexibleWidth]

    }
    
}

extension BreweryDetailTableVC: UITableViewDelegate {}

extension BreweryDetailTableVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.item {
        case 0:
            let informationCell = tableView.dequeueReusableCell(withIdentifier: BreweryInformationCell.reuseID, for: indexPath) as! BreweryInformationCell
            return informationCell
        
        case 1:
            let starRatingCell = tableView.dequeueReusableCell(withIdentifier: StarRatingCell.reuseID, for: indexPath) as! StarRatingCell
            return starRatingCell
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UITableViewCell
            return cell
        }
        
    }

}

//
//  ViewController.swift
//  Taps
//
//  Created by Liana Haque on 2/5/21.
//

import UIKit
import CoreLocation

class BreweryTableViewVC: UIViewController, CLLocationManagerDelegate {
        
    // UI
    private var tableView: UITableView!
    
    // Manager and Swift Framework class declarations
    private let locationManager = CLLocationManager()
    private let geoCodeManager = GeoCoderManager()
    private let breweryPresenter = BreweryTablePresenter()
    
    private var breweries = [Brewery]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureLocationManagerServices()
        configureTableView()
        //view.backgroundColor = .systemBackground
        view.backgroundColor = .red
        breweryPresenter.view = self
    }
    
    public func updateViewWithBreweries(breweries: [Brewery]) {
        self.breweries = breweries
        tableView.reloadData()
    }
        
    private func configureLocationManagerServices() {
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startMonitoringSignificantLocationChanges()
        }
    }

    private func configureTableView() {
        tableView = UITableView(frame: view.bounds)
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(BreweryCell.self, forCellReuseIdentifier: BreweryCell.reuseID)
    }
    
}

extension BreweryTableViewVC {
    #warning("Get the city name, domicile, postal code from CLPlacemark after you do this function.")
    #warning("This function might be doing too much by updating, converting and then asking to fetch breweries.")
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //let currentLocation: CLLocation = locations[0]
        
        geoCodeManager.convertCoordinatesToHumanReadableLocation(location: locations.first!).done { placemark in
            let city = String(placemark.subAdministrativeArea!)
            self.breweryPresenter.fetchBreweries(city: city)
        }
        
        tableView.reloadData()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        let alert = UIAlertController(title: "Couldn't update the location!", message: "Something went wrong with locationManager", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
}

extension BreweryTableViewVC: UITableViewDelegate{}

extension BreweryTableViewVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return breweries.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BreweryCell.reuseID, for: indexPath) as! BreweryCell

        cell.boldBreweryNameLabel.text = breweries[indexPath.row].name
        cell.subtitleCityLabel.text = breweries[indexPath.row].city
        cell.subtitleStateLabel.text = breweries[indexPath.row].state
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var breweryDetailVC = BreweryDetailVC()
        
        /// MARK: - TODO: DO NOT allow this vc to know about the breweryDetailVC
        self.navigationController?.pushViewController(breweryDetailVC, animated: true)  // the viewcontroller is grabbing the parent and tells it to push to the next vc and btw, it needs to be animated.  In fact, the child shouldn't even know who its parent is.
    }
}

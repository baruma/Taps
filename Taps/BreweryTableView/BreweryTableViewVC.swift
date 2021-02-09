//
//  ViewController.swift
//  Taps
//
//  Created by Liana Haque on 2/5/21.
//

import UIKit
import CoreLocation

class BreweryTableViewVC: UIViewController, CLLocationManagerDelegate {
        
    // UI variables
    private var tableView: UITableView!
    
    // Manager and Swift Framework class declarations
    private let locationManager = CLLocationManager()
    private let geoCodeManager = GeoCoderManager()
    private let breweryPresenter = BreweryTablePresenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureLocationManagerServices()
        configureTableView()
        view.backgroundColor = .systemBackground
        breweryPresenter.view = self // It's saying the view you want to talk to is me (via self).
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
    
//    func configure<Cell : ConfigurableCell, ResultType>(cell: Cell, fetchPromise: Promise<ResultType>) {
//        fetchPromise.done { result in
//            cell.configure(data: result as! Cell.DataType)  //JLI: Ideally, we shouldnt need ! or casting
//        }.catch { error in
//            let alertVC = UIAlertController(title: "Something went wrong!", message: "Try searching a place or restarting Sweater!", preferredStyle: .alert)
//            let confirmAction = UIAlertAction(title: "OK", style: .default) { action in
//                //
//            }
//            alertVC.addAction(confirmAction)
//            //let errorMessage = presenter.parseError(error: error)
//            //create ui controller with error message
//            // create error alert vc here to present error.
//
//            // if there is an error you need to seal . reject in repository
//            // you have to reject and go out
//            print(error)
//            self.presenter.parseNetworkErrors(error: error)
//            self.present(alertVC, animated: true, completion: nil)
//        }
//    }
}

extension BreweryTableViewVC {
    #warning("Get the city name, domicile, postal code from CLPlacemark after you do this function.")
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
        return 5
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BreweryCell.reuseID, for: indexPath) as! BreweryCell
       // cell.textLabel!.text = "Dog Fish Head"
        cell.subtitleCityLabel.text = "Boston"
        cell.subtitleStateLabel.text = "MA"
        cell.boldBreweryNameLabel.text = "AERONAUGHT"
        return cell
    }
}



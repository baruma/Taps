//
//  BreweryTableVCPresenter.swift
//  Taps
//
//  Created by Liana Haque on 2/7/21.
//

import Foundation
import CoreLocation
import PromiseKit

class BreweryTablePresenter {
    var description: String = ""
    public var view: BreweryTableViewVC? = nil
    private let breweryRepository: BreweryRepositoryProtocol = BreweryDBResponseRepository()
    
    func fetchBreweries(city: String) {
        // this bottom line doesn't work because it doesn't know that the class is behind the protocol which is good we dn't want these classes to know about each other
//        breweryRepository.fetchBreweriesAPIResponse(cityForEndpoint: city)
        breweryRepository.getBreweries(city: city).done { breweries in
            print(breweries)
        }
    }
}


/*
 #warning("Get the city name, domicile, postal code from CLPlacemark after you do this function.")s
 func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
     let currentLocation: CLLocation = locations[0]
     
     geoCodeManager.convertCoordinatesToHumanReadableLocation(location: locations.first!).done { placemark in
         print(placemark.subAdministrativeArea)  // we want to pass this over to the GeoCoder.  You can use protocols or you can use PromiseKit but nothing async is happening so consider protocols
     }

 }
 
 func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
     let alert = UIAlertController(title: "Couldn't update the location!", message: "Something went wrong with locationManager", preferredStyle: .alert)

     alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
     self.present(alert, animated: true)
 }
 */

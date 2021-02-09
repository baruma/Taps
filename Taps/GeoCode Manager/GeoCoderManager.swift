//
//  GeoCodeManager.swift
//  Taps
//
//  Created by Liana Haque on 2/7/21.
//

import Foundation
import CoreLocation
import PromiseKit

class GeoCoderManager {
    let geoCoder = CLGeocoder()

    // Need to write a function that converts coordinates to city, administrative area, and postal code.
    // This function resolves one flow of our code - getting user's current location and finding breweries associated with it.
    //
    // Originally this was written without PromiseKit but we had to swap immediately over because due to the async nature of geocoding, void values were being returned,
    // which conflicted with the return value of CLPlacemark
    func convertCoordinatesToHumanReadableLocation(location: CLLocation) -> Promise<CLPlacemark> {
        return Promise { seal in
            geoCoder.reverseGeocodeLocation(location) { (placemarks, error) in
                guard let placemarks = placemarks, let location = placemarks.first
                else {
                    print("Could not retrieve human readable location from coordinates.")
                    return seal.reject(error as! Error)
                }
                seal.fulfill(location)
            }
        }
    }
}

//
//  OneCallResponse.swift
//  Taps
//
//  Created by Liana Haque on 2/7/21.
//

import Foundation

/// Compiles all the other data models into here and pull all their data at once.  This way you do not have to call each individual data model class from the Repository.
class BreweryAPIModel: Codable {
    let id: Int
    let name: String
    let breweryType: String?
    let city: String?
    let state: String?
    let postalCode: String?
    let country: String?
    let latitude: String?
    let longitude: String?
    let phone: String?
    let website: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case breweryType = "brewery_type"
        case city = "city"
        case state = "state"
        case postalCode = "postal_code"
        case country = "country"
        case latitude = "latitude"
        case longitude = "longitude"
        case phone = "phone"
        case website = "website_url"
    }
}


/*
 {
   "id": 385,
   "name": "Black Hammer Brewing",
   "brewery_type": "micro",
   "street": "544 Bryant St",
   "address_2": null,
   "address_3": null,
   "city": "San Francisco",
   "state": "California",
   "county_province": null,
   "postal_code": "94107-1217",
   "country": "United States",
   "longitude": "-122.3969947",
   "latitude": "37.780655",
   "phone": "4155002273",
   "website_url": "http://www.blackhammerbrewing.com",
   "updated_at": "2018-08-23T23:25:33.033Z",
   "created_at": "2018-07-24T01:32:52.642Z"
 },
 */

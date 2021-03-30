//
//  Mapper.swift
//  Taps
//
//  Created by Liana Haque on 2/8/21.
//

import Foundation

class BreweryMapper {
//    func mapToWeatherDescriptionAggregate(current: Current) -> WeatherDescriptionAggregate {
//        var descriptions = [WeatherDescription]()
//        for weather in current.weather {
//            descriptions.append(WeatherDescription(main: weather.main, detailed: weather.description))
//        }
//        return WeatherDescriptionAggregate(descriptions: descriptions)
//    }

    /// Maps BreweryAPIModels to Taps Brewery Model.  To be used in in the DetailVC.
    func mapToBrewery(listOfBreweries: [BreweryAPIModel]) -> [Brewery] {
        var mappedBreweries = [Brewery]()
        for brewery in listOfBreweries {
            mappedBreweries.append(Brewery(
                                    id: brewery.id,
                                    name: brewery.name,
                                    breweryType: brewery.breweryType ?? "Brewrey Type Unavailable",
                                    city: brewery.city ?? "City Unavailable",
                                    state: brewery.state ?? "State Unavailable",
                                    postalCode: Int(brewery.postalCode ?? "0") ?? 0,
                                    country: brewery.country ?? "Country Unavailable",
                                    latitude: Double(brewery.latitude ?? "0.0") ?? 0,
                                    longitude: Double(brewery.longitude ?? "0.0") ?? 0,
                                    phone: Int(brewery.phone ?? "0") ?? 0,
                                    website: brewery.website ?? "Unavailable"))
        }
        return mappedBreweries
    }
    
    /// Maps Brewery name, city and state to BreweryDetailView
    /// Takes in a present Brewery (Same one used in the cell) and then use the information present in that.
    
    func mapToBreweryInformationView() {}
}

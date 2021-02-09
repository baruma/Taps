//
//  BreweryRepositoryProtocol.swift
//  Taps
//
//  Created by Liana Haque on 2/9/21.
//

import Foundation
import PromiseKit

 protocol BreweryRepositoryProtocol {
   func getBreweries(city: String) -> Promise<[Brewery]>
}


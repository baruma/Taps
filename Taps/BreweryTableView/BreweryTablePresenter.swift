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
   // private var breweriesForView = [Brewery]()
    public var view: BreweryTableViewVC? = nil
    
    /// TODO: - Attach and Detach functions need to be here.
    
    /// REMARK: - This can be changed in the future to be able to rotate between tests and repositories.
    private let breweryRepository: BreweryRepositoryProtocol = BreweryDBResponseRepository()
    
    func fetchBreweries(city: String) {
        breweryRepository.getBreweries(city: city).done { breweries in
            //self.breweriesForView = breweries
            self.view?.updateViewWithBreweries(breweries: breweries)
        }
    }
    
    /// doing this the view will never know when the presenter is ready.. instead the presenter should be telling the view to update.

}

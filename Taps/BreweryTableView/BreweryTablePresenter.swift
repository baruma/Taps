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
    public var view: BreweryTableVC? = nil
    
    /// TODO: - Attach and Detach functions need to be here.
    
    /// REMARK: - This can be changed in the future to be able to rotate between tests and repositories.
    private let breweryRepository: BreweryRepositoryProtocol = BreweryDBResponseRepository()
    
    func fetchBreweries(city: String) {
        breweryRepository.getBreweries(city: city).done { breweries in
            self.view?.updateViewWithBreweries(breweries: breweries)
        }
    }
    
    /// doing this the view will never know when the presenter is ready.. instead the presenter should be telling the view to update.

}

/*
 The presenter will tell the coordinater that I need to go here, and give that new view the data the presenter it has
 
 you can create a coordinater class taht the presenter will nknows about and the viewcontroller will likely make it.
 
 Createa  class that's a coordinater and that handles coordination.
 
 let the presenter instigate the navigation
 
 touch cell, tell presenter, the presenter hits the coordinator that needs to pass the information
 
 the coordinator needs to know about the navigationctontller, the controller will likely need to know uikit stuff, navigation in ios 
 */

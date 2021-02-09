//
//  BreweryDBResponseRepository.swift
//  Taps
//
//  Created by Liana Haque on 2/7/21.
//

import Foundation
import PromiseKit

enum NetworkError: Error {
    case clientError
    case responseCodeError
    case mimTypeError
}

class BreweryDBResponseRepository: BreweryRepositoryProtocol {
    func getBreweries(city: String) -> Promise<[Brewery]> {
        return Promise { seal in
        var cityString = (breweriesBaseEndpoint + cityBreweryEndpoint + "\(city)").addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        var cityStringAsURL = URL(string: cityString!)
        
        let task = session.dataTask(with: cityStringAsURL!) { data, response, error in

            if error != nil || data == nil {
                print("Client error!")
                guard let safeError = error else {
                    seal.reject(NetworkError.clientError)
                    return
                }
                seal.reject(safeError)
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("Server error!")
                guard let safeError = error else {
                    seal.reject(NetworkError.responseCodeError)
                    return
                }
                seal.reject(safeError)
                return
            }
            
            guard let mime = response.mimeType, mime == "application/json" else {
                print("Wrong MIME type!")
                guard let safeError = error else {
                    seal.reject(NetworkError.mimTypeError)
                    return
                }
                seal.reject(safeError)
                return
            }
            
            let desieralizedList = self.deserializeToBreweryAPIModel(response: data!)
            let mappedBreweries = self.mapper.mapToBrewery(listOfBreweries: desieralizedList)
            seal.fulfill(mappedBreweries)
        }
            
            task.resume()
        }
    }
    
    private let session = URLSession.shared
    private let breweriesBaseEndpoint = "https://api.openbrewerydb.org/breweries?"
    private let cityBreweryEndpoint = "by_city="
    
    private let mapper = BreweryMapper()

    // Retrieves payload of information from BreweryDB
    func fetchBreweriesAPIResponse(cityForEndpoint: String) {
        var cityString = (breweriesBaseEndpoint + cityBreweryEndpoint + "\(cityForEndpoint)").addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        var cityStringAsURL = URL(string: cityString!)
        
        let task = session.dataTask(with: cityStringAsURL!) { data, response, error in

            if error != nil || data == nil {
                print("Client error!")
                return
            }

            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("Server error!")
                return
            }

            guard let mime = response.mimeType, mime == "application/json" else {
                print("Wrong MIME type!")
                return
            }

            do {
                let desieralizedList = self.deserializeToBreweryAPIModel(response: data!)
                self.mapper.mapToBrewery(listOfBreweries: desieralizedList)
//                let json = try JSONSerialization.jsonObject(with: data!, options: [])
//                print(json)
                
                // this needs to be an array of breweryapimodel
               // mapper.mapToBrewery(listOfBreweries: data)
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }
        }

        task.resume()
    }
    
    // It is not advised to map in the convertToJSONResponse because it is doing too much now.
    // There is no sense of threading or async code since no networking is happening so there is no need for PromiseKit
    func deserializeToBreweryAPIModel(response: Data) -> [BreweryAPIModel] {
        let decoder = JSONDecoder()
        let listOfBreweries = try? decoder.decode([BreweryAPIModel].self, from: response)
        return listOfBreweries ?? [BreweryAPIModel]()
    }
    
    // Parses Brewery, City and State information from payload response.  This name is fine since it just lives in the view.
    func breweryCellViewModel() {
        
    }
}

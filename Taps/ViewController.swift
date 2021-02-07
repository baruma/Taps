//
//  ViewController.swift
//  Taps
//
//  Created by Liana Haque on 2/5/21.
//

import UIKit

class BreweryTableView: UIViewController {
    let session = URLSession.shared
    let stateURL = URL(string: "https://api.openbrewerydb.org/breweries?by_state=florida")!
    let breweriesExampleURL = URL(string: "https://api.openbrewerydb.org/breweries")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue

        let task = session.dataTask(with: stateURL) { data, response, error in

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
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                print(json)
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }
        }

        task.resume()
    }


}


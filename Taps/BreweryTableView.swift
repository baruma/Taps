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
    
    let tableView = UITableView()
    
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
    
    private func configureTableView() {
        
    }

}

extension BreweryTableView: UITableViewDelegate{}

extension BreweryTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! UITableViewCell
        cell.textLabel!.text = "Dog Fish Head"
        return cell
    }
}

//
//  HomeCoordinator.swift
//  Taps
//
//  Created by Liana Haque on 3/3/21.
//

import Foundation
import UIKit

// is basically a navigation delegate

class MainCoordinator: Coordinator {
    private let rootViewController: UINavigationController
    private let window: UIWindow
    
    init(window: UIWindow) {
       self.window = window
       self.rootViewController = UINavigationController()
    }
    
    func start() {
       window.rootViewController = rootViewController
       let breweryTableViewVC = BreweryTableViewVC(nibName: nil, bundle: nil)
       breweryTableViewVC.mainCoordinator = self
       rootViewController.pushViewController(breweryTableViewVC, animated: true)
       window.makeKeyAndVisible()
    }
    
    func goToDetailScreen(brewery: Brewery) {
        let breweryDetailVC = BreweryDetailVC()
        breweryDetailVC.brewery = brewery
        rootViewController.pushViewController(breweryDetailVC, animated: true)
    }

    func back() {
        rootViewController.popViewController(animated: true)
    }
}

/*
 Implementing this clsss' functions into the BreweryTableVC isn't the delegation pattern (I mean it kind of is in the sense that you're teeling a thing to be a delegate) instead we are using Dependency Injection.
 
 Passing a clsss into a constructor is basically dependency injection.
 
 A more senior way of handling a repository that will have functions be used in 5 view controllers would be writing a dependnency injection so there's only one instance of the repository.  this is a better method than making 5 instances you have dependency injection.  "why should I make this class on my own when I can get it"
 
 you have a repository class.  It implies you're fetching deleting changing data from a data source.  the best way to do a repository is to take in the actual data source yourself, and implement the fetch get set functions.
 
 You have another class that is the data provider (could be a database or api) that passes data into a repository.  In this case the repository depends on the datasource.  deesn't knwo about the data source itself.
 
 think about your vc's.  They depend on a coordinator to do any navigation, and they shouldn't know about them.
 
 the basic idea - for class a to do everything it needs to do, it may need to know about class b and c.  So how does class a get class b or c.  It gets it through protocols, dependency injections,
 
 construction and setter injection are the most common ones.  interface injection is the least common one.  one example of doing interface injection is in the pet adoption swift app - when you had protocols in other protocols.  the api protocol would make use of the search and add protocol.
 */

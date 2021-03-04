//
//  HomeCoordinator.swift
//  Taps
//
//  Created by Liana Haque on 3/3/21.
//

import Foundation
import UIKit

class BreweryTableViewVCCoordinator: Coordinator {
    //1
    private let window: UIWindow
    private let rootViewController: UINavigationController
    //2
    init(window: UIWindow) {
       self.window = window
       self.rootViewController = UINavigationController()
    }
    //3
    func start() {
       window.rootViewController = rootViewController
       let homeViewController = BreweryTableViewVC(nibName: nil, bundle: nil)
       rootViewController.pushViewController(homeViewController, animated: true)
       window.makeKeyAndVisible()
    }
}

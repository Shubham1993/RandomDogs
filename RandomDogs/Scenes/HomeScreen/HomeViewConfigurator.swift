//
//  HomeViewConfigurator.swift
//  RandomDogs
//
//  Created by Shubham Gupta on 12/30/19.
//  Copyright © 2019 Shubham Gupta. All rights reserved.
//

import Foundation

protocol HomeViewConfigurator {
    func configure(viewController: HomeViewController)
}

class HomeViewConfiguratorImplementation: HomeViewConfigurator {
    func configure(viewController: HomeViewController) {
        let router = HomeViewRouterImplementation(homeViewController: viewController)
        let presenter = HomeViewPresenterImplementation(view: viewController, router: router)
        viewController.presenter = presenter
    }
}

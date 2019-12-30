//
//  RecentDogsViewConfigurator.swift
//  RandomDogs
//
//  Created by Shubham Gupta on 12/29/19.
//  Copyright © 2019 Shubham Gupta. All rights reserved.
//

import Foundation
protocol RecentDogsViewConfigurator {
    func configure(viewController: RecentDogsViewController)
}

class RecentDogsViewConfiguratorImplementation: RecentDogsViewConfigurator {
    func configure(viewController: RecentDogsViewController) {
        let lruCache = SharedData.shared.getLRUCache()
        let router = RecentDogsViewRouterImplementation(recentDogsViewController: viewController)
        let presenter = RecentDogsViewPresenterImplementation(view: viewController, router: router, lruCache: lruCache)
        viewController.presenter = presenter
    }
}

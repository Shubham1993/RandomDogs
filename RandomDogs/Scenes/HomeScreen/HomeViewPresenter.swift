//
//  HomeViewPresenter.swift
//  RandomDogs
//
//  Created by Shubham Gupta on 12/30/19.
//  Copyright © 2019 Shubham Gupta. All rights reserved.
//

import Foundation

protocol HomeView {
    
}

protocol HomeViewPresenter {
    var router: HomeViewRouter { get }
    func generateDogsClicked()
    func recentDogsClicked()
}

class HomeViewPresenterImplementation {
    
    private(set) var router: HomeViewRouter
    fileprivate var view: HomeView
    
    init(view: HomeView, router: HomeViewRouter) {
        self.view = view
        self.router = router
    }
}

extension HomeViewPresenterImplementation: HomeViewPresenter {
    func generateDogsClicked() {
        router.moveToGenerateDogScreen()
    }
    
    func recentDogsClicked() {
        router.moveToRecentDogsScreen()
    }
}

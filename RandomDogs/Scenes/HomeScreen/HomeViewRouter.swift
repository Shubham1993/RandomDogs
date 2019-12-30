//
//  HomeViewRouter.swift
//  RandomDogs
//
//  Created by Shubham Gupta on 12/30/19.
//  Copyright © 2019 Shubham Gupta. All rights reserved.
//

import Foundation
import UIKit

protocol HomeViewRouter: ViewRouter {
    func moveToGenerateDogScreen()
    func moveToRecentDogsScreen()
}

class HomeViewRouterImplementation {
    
    private var homeViewController: HomeViewController
    
    init(homeViewController: HomeViewController) {
        self.homeViewController = homeViewController
    }
}

extension HomeViewRouterImplementation: HomeViewRouter {
    func moveToGenerateDogScreen() {
        homeViewController.performSegue(withIdentifier: Constants.Segues.generateDogSegue, sender: nil)
    }
    
    func moveToRecentDogsScreen() {
        homeViewController.performSegue(withIdentifier: Constants.Segues.recentDogsSegue, sender: nil)
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}

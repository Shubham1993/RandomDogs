//
//  HomeViewController.swift
//  RandomDogs
//
//  Created by Shubham Gupta on 12/30/19.
//  Copyright © 2019 Shubham Gupta. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var configurator = HomeViewConfiguratorImplementation()
    var presenter: HomeViewPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(viewController: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func generateDogs(_ sender: Any) {
        presenter.generateDogsClicked()
    }
    
    @IBAction func moveToRecentDogs(_ sender: Any) {
       presenter.recentDogsClicked()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        presenter.router.prepare(for: segue, sender: sender)
    }
}


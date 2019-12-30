//
//  RecentDogsViewController.swift
//  RandomDogs
//
//  Created by Shubham Gupta on 12/29/19.
//  Copyright © 2019 Shubham Gupta. All rights reserved.
//

import UIKit

class RecentDogsViewController: UIViewController {
    
    @IBOutlet weak var recentDogsCollectionView: UICollectionView!
    
    var configurator = RecentDogsViewConfiguratorImplementation()
    var presenter: RecentDogsViewPresenter!
    var images = [String]()
    let cache = SharedData.shared.getLRUCache()
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(viewController: self)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear()
        self.navigationController?.navigationBar.isHidden = false
    }

    // MARK: - Actions
    
    
    @IBAction func clearDogs(_ sender: Any) {
        SharedData.shared.getLRUCache().clearCache()
        UserDefaults.standard.set(nil, forKey: "lruCache")
        recentDogsCollectionView.reloadData()
    }
    
      override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          presenter.router.prepare(for: segue, sender: sender)
      }
}

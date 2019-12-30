//
//  GenerateDogsViewController.swift
//  RandomDogs
//
//  Created by Shubham Gupta on 12/28/19.
//  Copyright © 2019 Shubham Gupta. All rights reserved.
//

import UIKit

class GenerateDogsViewController: UIViewController {

    @IBOutlet weak var dogImageView: UIImageView!
    
    var configurator = GenerateDogsViewConfiguratorImplementation()
    var presenter: GenerateDogsViewPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configurator.configure(viewController: self)
        self.navigationController?.navigationBar.isHidden = false
    }
    

    
    
    // MARK: - Actions
    
    @IBAction func generateDog(_ sender: Any) {
        presenter.generateRandomDog()
    }
    
      override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          presenter.router.prepare(for: segue, sender: sender)
      }

}

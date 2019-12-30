//
//  GenerateDogsViewRouter.swift
//  RandomDogs
//
//  Created by Shubham Gupta on 12/28/19.
//  Copyright © 2019 Shubham Gupta. All rights reserved.
//

import UIKit
import Foundation

protocol GenerateDogsViewRouter: ViewRouter {
    
}

class GenerateDogsViewRouterImplementation {
    fileprivate weak var generateDogsViewController: GenerateDogsViewController?
    init(generateDogsViewController: GenerateDogsViewController) {
        self.generateDogsViewController = generateDogsViewController
    }
}

extension GenerateDogsViewRouterImplementation: GenerateDogsViewRouter {
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}

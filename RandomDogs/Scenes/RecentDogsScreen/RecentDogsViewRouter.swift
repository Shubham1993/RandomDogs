//
//  RecentDogsViewRouter.swift
//  RandomDogs
//
//  Created by Shubham Gupta on 12/29/19.
//  Copyright © 2019 Shubham Gupta. All rights reserved.
//

import Foundation
import UIKit
import Foundation

protocol RecentDogsViewRouter: ViewRouter {
    
}

class RecentDogsViewRouterImplementation {
    fileprivate weak var recentDogsViewController: RecentDogsViewController?
    init(recentDogsViewController: RecentDogsViewController) {
        self.recentDogsViewController = recentDogsViewController
    }
}

extension RecentDogsViewRouterImplementation: RecentDogsViewRouter {
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}

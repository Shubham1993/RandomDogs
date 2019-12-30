//
//  ViewRouter.swift
//  RandomDogs
//
//  Created by Shubham Gupta on 12/28/19.
//  Copyright © 2019 Shubham Gupta. All rights reserved.
//

import UIKit
protocol ViewRouter {
    func prepare(for segue: UIStoryboardSegue, sender: Any?)
}


extension ViewRouter {
    func prepare(for segue: UIStoryboardSegue, sender: Any?) { }
}

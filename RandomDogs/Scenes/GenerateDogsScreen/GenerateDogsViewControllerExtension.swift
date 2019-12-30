//
//  GenerateDogsViewControllerExtension.swift
//  RandomDogs
//
//  Created by Shubham Gupta on 12/28/19.
//  Copyright © 2019 Shubham Gupta. All rights reserved.
//

import Foundation

extension GenerateDogsViewController: GenerateDogsView {
    func showDog(withUrl url: String) {
        dogImageView.download(from: url)
    }
}

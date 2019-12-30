//
//  Constants.swift
//  RandomDogs
//
//  Created by Shubham Gupta on 12/28/19.
//  Copyright © 2019 Shubham Gupta. All rights reserved.
//

import Foundation

struct Constants {
    private init() { }
    
    struct Segues {
        private init() { }
        
        static let generateDogSegue: String = "generateDogsSegue"
        static let recentDogsSegue: String = "recentDogsSegue"
    }
    
    static let randomImageUrl: String = "https://dog.ceo/api/breeds/image/random"
}

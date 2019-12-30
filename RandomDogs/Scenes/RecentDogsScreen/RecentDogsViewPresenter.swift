//
//  RecentDogsViewPresenter.swift
//  RandomDogs
//
//  Created by Shubham Gupta on 12/29/19.
//  Copyright © 2019 Shubham Gupta. All rights reserved.
//

import Foundation
protocol RecentDogsView {
  
}

protocol RecentDogsViewPresenter {
    var router: RecentDogsViewRouter { get }
    func getImagesFromCache() -> [Data]
    func viewWillAppear() 
}

class RecentDogsViewPresenterImplementation {
    
    fileprivate var view: RecentDogsView
    fileprivate var lruCache: CacheLRU<String, Any>
    private(set) var router: RecentDogsViewRouter
    
    init(view: RecentDogsView, router: RecentDogsViewRouter, lruCache: CacheLRU<String, Any>) {
        self.router = router
        self.lruCache = lruCache
        self.view = view
    }
}

extension RecentDogsViewPresenterImplementation: RecentDogsViewPresenter {
    
    func viewWillAppear() {
        
    }
    
    func getImagesFromCache() -> [Data] {
        let data = lruCache.getRecentData()
        var allItems = [Data]()
        for (_ , j) in data.enumerated() {
            if let j = j {
                allItems.append(j.value as! Data)
            }
        }
        return allItems
    }
}

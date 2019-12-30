//
//  SharedData.swift
//  RandomDogs
//
//  Created by Shubham Gupta on 12/29/19.
//  Copyright © 2019 Shubham Gupta. All rights reserved.
//

import Foundation

class SharedData {
    
    private init() { }
      
    static let shared = SharedData()
    var lruCache = CacheLRU<String, Any>()
    func getLRUCache() -> CacheLRU<String, Any>{
        let decodedData = UserDefaults.standard.object(forKey: "lruCache") as? Data
        if let decodedData = decodedData {
            let cachePayload = NSKeyedUnarchiver.unarchiveObject(with: decodedData) as? [[String: Data]]
            if let cachePayload = cachePayload {
                for (_ ,j) in cachePayload.enumerated() {
                    for (l , m) in j {
                        lruCache.setValue(m, for: l)
                    }
                }
                return lruCache
            }
            
        }
        return lruCache
    }
}

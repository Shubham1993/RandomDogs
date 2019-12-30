//
//  UIImageExtension.swift
//  RandomDogs
//
//  Created by Shubham Gupta on 12/28/19.
//  Copyright © 2019 Shubham Gupta. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func download(from urlString: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: urlString) else { return }
        contentMode = mode
        let cache = SharedData.shared.getLRUCache()
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            cache.setValue(data, for: urlString)
            let tempData  = self.getArrayOfObjects(cache.getRecentData())
            let encodedData = try? NSKeyedArchiver.archivedData(withRootObject: tempData, requiringSecureCoding: false)
            UserDefaults.standard.setValue(encodedData, forKey: "lruCache")
            UserDefaults.standard.synchronize()
            
            DispatchQueue.main.async() {
                self.image = image
            }
        }.resume()
    }
    
    func getArrayOfObjects(_ data: [CacheLRU<String, Any>.CachePayload?]) -> [[String: Data]] {
        var array = [[String: Data]]()
        for (_,j) in data.reversed().enumerated() {
            if let d = j {
                let dict = [d.key: d.value as! Data]
                array.append(dict)
            }
        }
        return array
    }
}

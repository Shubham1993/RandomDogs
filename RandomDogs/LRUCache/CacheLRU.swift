//
//  CacheLRU.swift
//  RandomDogs
//
//  Created by Shubham Gupta on 12/29/19.
//  Copyright © 2019 Shubham Gupta. All rights reserved.
//

import Foundation
final class CacheLRU<Key: Hashable, Value> {
    
    public struct CachePayload {
        let key: Key
        let value: Value
    }
    
    private var currenNode: DoublyLinkedListNode<CachePayload>?
    private var capacity: Int
    private let list = DoublyLinkedList<CachePayload>()
    private var nodesDict = [Key: DoublyLinkedListNode<CachePayload>]()
    
    init(_ capacity: Int = 0) {
        self.capacity = max(0, capacity)
    }
    
    func setCapacity(capacity: Int) {
        self.capacity = capacity
    }
    
    func setValue(_ value: Value, for key: Key) {
        let payload = CachePayload(key: key, value: value)
        
        if let node = nodesDict[key] {
            node.payload = payload
            list.moveToHead(node)
        } else {
            let node = list.addHead(payload)
            nodesDict[key] = node
        }
        
        if list.count > capacity {
            let nodeRemoved = list.removeLast()
            if let key = nodeRemoved?.payload.key {
                nodesDict[key] = nil
            }
        }
    }
    
    func getCurrentSize() -> Int {
        return list.count
    }
    
    
    func getRecentData() -> [CachePayload?] {
        return list.items()
    }
    
    func getValue(for key: Key) -> Value? {
        guard let node = nodesDict[key] else { return nil }
        
        list.moveToHead(node)
        
        return node.payload.value
    }
    
    func clearCache() {
        nodesDict.removeAll()
        while list.count > 0 {
            list.removeLast()
        }
    }
    
    class func path() -> String {
        let documentsPath = NSSearchPathForDirectoriesInDomains (FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first
        let path = documentsPath?.appending ("/lruCachePath")
        return path!
    }
    
    deinit {
        clearCache()
    }
}

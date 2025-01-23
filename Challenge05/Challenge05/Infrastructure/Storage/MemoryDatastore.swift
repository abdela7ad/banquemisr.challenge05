//
//  MemoryDatastore.swift
//  Challenge05
//
//  Created by Abdelahad on 22/01/2025.
//

import os

final class MemoryDatastore: Datastore {
    private let lock = OSAllocatedUnfairLock()
    private var map: [String: Codable] = [:]
    
    func save<T: Codable>(key: String, value: T){
        lock.lock()
        map[key] = value
        lock.unlock()
    }
    
    func get<T: Codable>(key: String) -> T? {
        lock.lock()
        defer { lock.unlock() }
        return map[key] as? T
    }
    
    func remove(key: String) {
        lock.lock()
        map.removeValue(forKey: key)
        lock.unlock()
    }
    
    func flush() {
        lock.lock()
        map.removeAll(keepingCapacity: true) // will likely need similar capacity
        lock.unlock()
    }
}

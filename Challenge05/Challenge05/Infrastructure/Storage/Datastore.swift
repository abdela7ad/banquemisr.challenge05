//
//  Datastore.swift
//  Challenge05
//
//  Created by Abdelahad on 22/01/2025.
//


/// The Datastore protocol describes the base behavior that all datastores in the system
/// should follow.  A datastore should be able to save any type of object as long as it
/// conforms to the Codable protocol.

protocol Datastore {
    func save<T: Codable>(key: String, value: T)
    
    func get<T: Codable>(key: String) -> T?
    
    func remove(key: String)
    
    func flush()
}

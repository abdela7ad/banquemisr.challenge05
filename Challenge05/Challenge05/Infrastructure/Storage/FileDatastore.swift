//
//  FileDatastore.swift
//  Challenge05
//
//  Created by Abdelahad on 23/01/2025.
//

import Foundation

final class FileDatastore: Datastore {
    private let purpose: String
    private let baseUrl: URL
    
    init(purpose: String) {
        self.purpose = purpose
        self.baseUrl = URL
            .applicationSupportDirectory
            .appendingPathComponent("file-datastore")
            .appendingPathComponent(self.purpose)
        
        // Make sure our storage directory is there
        try? FileManager.default.createDirectory(at: self.baseUrl,
                                                       withIntermediateDirectories: true)
    }
    
    func get<T>(key: String) -> T? where T : Decodable, T : Encodable {
        let url = baseUrl.appendingPathComponent(key)
        do {
            guard FileManager.default.fileExists(atPath: url.path) else {
                return nil
            }
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            return nil
        }
    }
    
    func save<T>(key: String, value: T) where T : Decodable, T : Encodable {
        do {
            let data = try JSONEncoder().encode(value)
            let url = baseUrl.appendingPathComponent(key)
            try data.write(to: url)
        }
        catch {
            debugPrint(error.localizedDescription)
        }
    }
    
   func remove(key: String) {
        let url = baseUrl.appendingPathComponent(key)

        //If the file doesn't exist, we're done!
        let fm = FileManager.default
        guard fm.fileExists(atPath: url.path) else {
            return
        }
        
        do {
            try fm.removeItem(at: url)
        } catch {
            debugPrint(error.localizedDescription)
        }
    }
    
    func flush() {
        //If the folder doesn't exist, we're done!
        let fm = FileManager.default
        guard fm.fileExists(atPath: baseUrl.path) else {
            return
        }
        do {
            let contentUrls = try fm.contentsOfDirectory(at: baseUrl, includingPropertiesForKeys: nil)
            for url in contentUrls {
                try fm.removeItem(at: url)
            }
        } catch {
            debugPrint(error.localizedDescription)
        }
    }
}

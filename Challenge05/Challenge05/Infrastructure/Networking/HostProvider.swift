//
//  HostProvider.swift
//  Challenge05
//
//  Created by Abdelahad on 22/01/2025.
//

import Foundation

protocol HostProvider {
    func getHost() -> URL
}

struct MoviedbHostProvider: HostProvider {
    func getHost() -> URL {
        return URL(staticString: "https://api.themoviedb.org/3/movie/")
    }
}

//
//  URL+Extension.swift
//  Challenge05
//
//  Created by Abdelahad on 22/01/2025.
//

import Foundation

extension URL {
    init(staticString: StaticString) {
        guard let url = URL(string: String(describing: staticString)) else {
            /// Checks a necessary condition for making forward progress.
            preconditionFailure("Invalid static URL string: \(staticString)")
        }
        self = url
    }
}

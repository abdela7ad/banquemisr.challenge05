//
//  TokenProvider.swift
//  Challenge05
//
//  Created by Abdelahad on 22/01/2025.
//

protocol TokenProvider {
    func token() -> String
}

struct BearerTokenProvider: TokenProvider {
    func token() -> String {
       "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzNGM3OWZiOTFmNGE3OTBjMWU5MmI2ZmJjMmY2YTI0ZiIsIm5iZiI6MTczNzQ0NDMyNS4zNzQsInN1YiI6IjY3OGY0YmU1Zjg3ZjQxMTllNmFhYTk1YSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.C4GFTyqpGE9UrQCzZbpkLjiTTMetELOgD8nwTCy1huU"
    }
}

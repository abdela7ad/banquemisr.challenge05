//
//  MainMovieRepositoryTests.swift
//  Challenge05Tests
//
//  Created by Abdelahad on 24/01/2025.
//

import XCTest
@testable import Challenge05

final class MainMovieRepositoryTests: XCTestCase {

    func testMovieRepositoryFetching() async throws {
        let sut = MainMovieRepository(
            service: MockMovieService(),
            datastore: MainMovieDatastore(dataStore: MemoryDatastore()))
        
        let listOfMovies = try await sut.movies(path: ListMovieSource.popular.path, page: 1)
        XCTAssertTrue(listOfMovies.movies == Movie.fakeMovieList)
        
        let movieDetails = try await sut.movieDetail(movieId: 939243)
        XCTAssertTrue(movieDetails == MovieDetail.fakeMovieDetail)
    }
    
    func testMovieRepositoryCaching() async throws {
        let datastore = MainMovieDatastore(dataStore: MemoryDatastore())
        let happySut = MainMovieRepository(
            service: MockMovieService(),
            datastore: datastore)
        
        let listOfMovies = try await happySut.movies(path: ListMovieSource.popular.path, page: 1)
        XCTAssertTrue(listOfMovies.movies == Movie.fakeMovieList)
        
        let cachedResults = datastore.cachedMovies(suffixKey: "\(ListMovieSource.popular.path).\(1)")
        let results = try XCTUnwrap(cachedResults)
        XCTAssertTrue(results.movies == Movie.fakeMovieList)
    }
}

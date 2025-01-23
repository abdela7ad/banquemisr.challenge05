//
//  MovieListViewModels.swift
//  Challenge05Tests
//
//  Created by Abdelahad on 24/01/2025.
//

import XCTest
@testable import Challenge05

final class MovieListViewModelTests: XCTestCase {

    func testMovieListFetchAndLoadMore() async {
        let sut = MovieListViewModel(source: .nowPlaying, movieRepository: MockMovieRepository())
        XCTAssertTrue(sut.source == .nowPlaying)
        
        /// loadMovies
        await sut.loadMovies()
        XCTAssertTrue(sut.datasource == [1: Movie.fakeMovieList])
        
        /// load More
        await sut.loadMore()
        XCTAssertTrue(sut.datasource.count == 2)
        XCTAssertTrue(sut.datasource[1] == Movie.fakeMovieList)
        XCTAssertTrue(sut.datasource[2] == Movie.fakeMovieList)
    }
    
    func testMovieListFetchErrorMessage() async {
        let sut = MovieListViewModel(source: .upcomingPlaying, movieRepository: MockMovieRepository(error: NetworkError.noInternetConnection))
       
        XCTAssertTrue(sut.source == .upcomingPlaying)
        
        await sut.loadMovies()
        switch sut.state {
        case .error(let message):
            XCTAssertTrue(message == NetworkError.noInternetConnection.readableMessage)
        default:
            XCTAssertThrowsError("No Correct state")
        }
    }
}

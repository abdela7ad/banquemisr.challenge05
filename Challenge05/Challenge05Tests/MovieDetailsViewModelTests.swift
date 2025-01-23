//
//  MovieDetailsViewModelTests.swift
//  Challenge05Tests
//
//  Created by Abdelahad on 24/01/2025.
//

import XCTest
@testable import Challenge05

final class MovieDetailsViewModelTests: XCTestCase {

    func testMovieListDetailsLoadMovieDetail() async {
        let sut = MovieDetailsViewModel(movie: Movie.fakeMovie,movieRepository: MockMovieRepository())
        
        /// loadMovieDetail
        await sut.loadMovieDetail()
        
        XCTAssertTrue(sut.title == MovieDetail.fakeMovieDetail.title)
        XCTAssertTrue(sut.tagline == MovieDetail.fakeMovieDetail.tagline)
        XCTAssertTrue(sut.revenu == MovieDetail.fakeMovieDetail.revenue)
        XCTAssertTrue(sut.runtime == MovieDetail.fakeMovieDetail.runtime * 60)
        XCTAssertTrue(sut.posterPath == MovieDetail.fakeMovieDetail.backdropPathUrl)
        XCTAssertTrue(sut.overview == MovieDetail.fakeMovieDetail.overview)
    }
}

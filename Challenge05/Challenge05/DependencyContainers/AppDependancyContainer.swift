//
//  AppDependancyContainer.swift
//  Challenge05
//
//  Created by Abdelahad on 23/01/2025.
//

final class AppDependancyContainer {
    static let shared = AppDependancyContainer()

    private let hostProvider: HostProvider
    private let tokenProvider: TokenProvider
    private let networkProvider: NetworkProvider
    private let decoderProvider: DecoderProvider
    
    private init() {
        hostProvider = MoviedbHostProvider()
        tokenProvider = BearerTokenProvider()
        decoderProvider = DefaultJsonDecoder()
        networkProvider = BasicNetworkProvider(tokenProvider: tokenProvider, decoderProvider: decoderProvider)
    }
    
    lazy var movieDependacyContainer: MovieDependacyContainer = {
        return MovieDependacyContainer(
            hostProvider: hostProvider,
            networkProvider: networkProvider)
    }()
}

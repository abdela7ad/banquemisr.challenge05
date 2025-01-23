//
//  TabBarItem.swift
//  Challenge05
//
//  Created by Abdelahad on 21/01/2025.
//

enum TabBarItem: String, CaseIterable, Identifiable {
    case nowPlaying
    case popular
    case upcomingPlaying
    
    var id: String { rawValue }
    
    var title: String {
        switch self {
        case .nowPlaying:
            "Now Playing"
        case .popular:
            "Popular"
        case .upcomingPlaying:
            "Upcoming Playing"
        }
    }
    
    var systemIconName: String {
        switch self {
        case .nowPlaying:
            "play.circle"
        case .popular:
            "rectangle.stack.badge.play"
        case .upcomingPlaying:
            "play.rectangle.on.rectangle"
        }
    }
}

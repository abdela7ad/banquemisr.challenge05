//
//  TabItemModifier.swift
//  Challenge05
//
//  Created by Abdelahad on 21/01/2025.
//

import SwiftUI

struct TabItemModifier: ViewModifier {
    private let tabBarItem: TabBarItem

    init(tabBarItem: TabBarItem) {
        self.tabBarItem = tabBarItem
    }
    func body(content: Content) -> some View {
        content
            .tag(tabBarItem.id)
            .tabItem {
                Label {
                    Text(tabBarItem.title)
                } icon: {
                    Image(systemName: tabBarItem.systemIconName)
                }
            }
    }
}

extension View {
    func tabItem(_ tabBarItem: TabBarItem) -> some View {
        modifier(TabItemModifier(tabBarItem: tabBarItem))
    }
}

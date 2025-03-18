//
//  MainTabView.swift
//  NewsApp
//
//  Created by Olanrewaju Olakunle  on 18/03/2025.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            LocationNewsView()
                .tabItem {
                    Label("Location", systemImage: "location.circle")
                }
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
        }
    }
}

#Preview {
    MainTabView()
}

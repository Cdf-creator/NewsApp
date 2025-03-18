//
//  HomeView.swift
//  NewsApp
//
//  Created by Olanrewaju Olakunle  on 18/03/2025.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.articles) { article in
                NavigationLink(destination: NewsDetailView(article: article)) {
                    Text(article.title)
                }
            }
            .navigationTitle("Global News")
            .onAppear {
                print("it called")
                viewModel.fetchNews()
            }
        }
    }
}


#Preview {
    HomeView()
}

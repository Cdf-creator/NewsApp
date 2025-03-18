//
//  LocationNewsView.swift
//  NewsApp
//
//  Created by Olanrewaju Olakunle  on 18/03/2025.
//

import SwiftUI

struct LocationNewsView: View {
    @StateObject private var locationManager = LocationManager()
    @StateObject private var viewModel = LocationNewsViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.articles, id: \.title) { article in
                NavigationLink(destination: NewsDetailView(article: article)) {
                    VStack(alignment: .leading) {
                        Text(article.title)
                            .font(.headline)
                        Text(article.description ?? "")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle("Local News")
            .onAppear {
                print("loaded")
                //view load
            }
            .onChange(of: locationManager.countryCode) { newCountryCode in
                print("onchanged is called")
                if let countryCode = newCountryCode {
                    print("countryCode: \(countryCode)")
                    viewModel.fetchNews(for: countryCode)
                }
            }
        }
    }
}

#Preview {
    LocationNewsView()
}

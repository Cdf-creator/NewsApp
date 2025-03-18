//
//  LocationNewsViewModel.swift
//  NewsApp
//
//  Created by Olanrewaju Olakunle  on 18/03/2025.
//

import Foundation
import Combine

class LocationNewsViewModel: ObservableObject {
    @Published var articles: [Article] = []
    private var cancellables = Set<AnyCancellable>()
    let apiKey: String = Bundle.main.apiKey  // Fetch from .xcconfig
    
    func fetchNews(for countryCode: String) {
        print("Fetching news for country inside LocationNewsViewModel: \(countryCode)")
        print("API Key inside LocationNewsViewModel: \(apiKey)") // Debugging
        
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=\(countryCode)&apiKey=\(apiKey)") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map { output -> Data in
                print("Raw Response Data:", String(data: output.data, encoding: .utf8) ?? "No Data")
                return output.data
            }
            .decode(type: NewsResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("API Request Failed: \(error.localizedDescription)")
                case .finished:
                    print("API Request Succeeded")
                }
            }, receiveValue: { response in
                self.articles = response.articles
                print("Loaded \(self.articles.count) articles for countryCode \(countryCode)")
            })
            .store(in: &cancellables)
    }
}

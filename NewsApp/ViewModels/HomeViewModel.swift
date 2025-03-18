//
//  HomeViewModel.swift
//  NewsApp
//
//  Created by Olanrewaju Olakunle  on 18/03/2025.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var articles: [Article] = []
    private var cancellables = Set<AnyCancellable>()
    let apiKey: String = Bundle.main.apiKey  //Fetch from .xcconfig

    func fetchNews() {
        print("API Key: \(apiKey)") // Debugging
        print("Info.plist Contents: \(Bundle.main.infoDictionary ?? [:])")
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=\(apiKey)") else {
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
                print("Loaded \(self.articles.count) articles")
            })
            .store(in: &cancellables)
    }

}


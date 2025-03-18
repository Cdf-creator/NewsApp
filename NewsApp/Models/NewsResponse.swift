//
//  NewsResponse.swift
//  NewsApp
//
//  Created by Olanrewaju Olakunle  on 18/03/2025.
//

import Foundation

struct NewsResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

struct Article: Codable, Identifiable {
    var id: String { url } // Use URL as a unique identifier
    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String?
}


struct Source: Codable {
    let id: String?
    let name: String
}

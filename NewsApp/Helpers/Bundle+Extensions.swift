//
//  Bundle+Extensions.swift
//  NewsApp
//
//  Created by Olanrewaju Olakunle  on 18/03/2025.
//

import Foundation

/*extension Bundle {
    var apiKey: String {
        return object(forInfoDictionaryKey: "NEWS_API_KEY") as? String ?? "no api key"
    }
}*/

extension Bundle {
    var apiKey: String {
        return object(forInfoDictionaryKey: "NEWS_API_KEY") as? String ?? "no api key"
    }
}

//
//  NewsDetailView.swift
//  NewsApp
//
//  Created by Olanrewaju Olakunle  on 18/03/2025.
//

import SwiftUI

struct NewsDetailView: View {
    // let article: NewsArticle
    let article: Article
    
    var body: some View {
        VStack {
            Text(article.title)
                .font(.title)
            Text(article.description ?? "No description available")
        }
        .padding()
    }
}

/*#Preview {
 NewsDetailView()
 }*/

//
//  NewsStore.swift
//  tea
//
//  Created by Syber Expertise on 21/10/2022.
//

import Foundation


class NewsStore:ObservableObject{
    @Published var selected : String = ""
    
    enum HomeState {
        case idle
        case loading
        case success(news:[NewsVM])
        case error(message:String)
    }
    
    @Published var state:HomeState = .idle
}

extension NewsStore:NewsPresenterDisplayLogic{
    func renderLoading() {
        self.state = .loading
    }
    
    func renderNews(news: [NewsVM]) {
        self.state = .success(news: news)
    }
    
    func renderError(_ errorMessage: String) {
        self.state = .error(message: errorMessage)
    }
    
    
}

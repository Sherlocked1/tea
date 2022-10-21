//
//  NewsServices.swift
//  tea
//
//  Created by Syber Expertise on 21/10/2022.
//

import Foundation

let apiKey = "pub_125036f0ea2fe2be21ee5cbcd031c350738d0"

let headers = [
    "Accept": "application/json; charset=utf-8",
    "Content-Type": "application/json; charset=utf-8",
]

class NewsServices : NewsServicesProtocol {
    
    func fetchNews(withCategory category: String, completion: @escaping afCallback) {
        let api = "https://newsdata.io/api/1/news?apikey=\(apiKey)&category=\(category)&language=en"
        NetworkClient.main.call(api: api, usingMethod: .get, withHeaders: headers, andParameters: [:], callback: completion)
    }
    
    
}

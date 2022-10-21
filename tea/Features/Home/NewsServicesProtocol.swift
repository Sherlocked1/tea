//
//  NewsServicesProtocol.swift
//  tea
//
//  Created by Syber Expertise on 21/10/2022.
//

import Foundation

protocol NewsServicesProtocol{
    func fetchNews(withCategory category:String,completion:@escaping afCallback)
}

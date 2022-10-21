//
//  NewsPresenter.swift
//  tea
//
//  Created by Syber Expertise on 21/10/2022.
//

import Foundation
import SwiftyJSON

protocol NewsPresenterProtocol:AnyObject {
    func fetchNews(withCategory category:String)
}

protocol NewsPresenterDisplayLogic:AnyObject {
    func renderLoading()
    func renderNews(news:[NewsVM])
    func renderError(_ errorMessage:String)
}

class NewsPresenter : NewsPresenterProtocol {
    
    private var service:NewsServicesProtocol
    private var delegate :NewsPresenterDisplayLogic
    
    init(service: NewsServicesProtocol, delegate: NewsPresenterDisplayLogic) {
        self.service = service
        self.delegate = delegate
    }
    
    func fetchNews(withCategory category:String) {
        self.delegate.renderLoading()
        self.service.fetchNews(withCategory: category) { data, error in
            
            print("data :::: ",JSON(data),"\n")
            if error != nil {
                self.delegate.renderError(error?.localizedDescription ?? "")
                print(error)
            }else{
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(responseDTO.self, from: data!)
                    let dto = response.results
                    
                    let viewModel:[NewsVM] = dto.map { dto in
                        return NewsVM.mapFrom(dto)
                    }
                    
                    self.delegate.renderNews(news: viewModel)
                    
                }catch{
                    print(error)
                    self.delegate.renderError(error.localizedDescription)
                }
                
            }
        }
    }
    
    
}

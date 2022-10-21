//
//  AuthPresenter.swift
//  tea
//
//  Created by Syber Expertise on 21/10/2022.
//

import Foundation

protocol AuthPresenterProtocol:AnyObject {
    func login()
}

protocol AuthPresentDisplayLogic:AnyObject {
    func renderLoading()
    func renderSuccess()
    func renderError(_ errorMessage:String)
}

class AuthPresenter : AuthPresenterProtocol {
    
    private var service:AuthServicesProtocol
    private var delegate :AuthPresentDisplayLogic
    
    init(service: AuthServicesProtocol, delegate: AuthPresentDisplayLogic) {
        self.service = service
        self.delegate = delegate
    }
    
    func login() {
        
        self.delegate.renderLoading()
        
        service.loginUser { data, error in
            if error != nil {
                self.delegate.renderError(error?.localizedDescription ?? "")
            }else{
                self.delegate.renderSuccess()
            }
        }
    }
    
    
}

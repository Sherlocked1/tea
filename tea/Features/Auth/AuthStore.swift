//
//  AuthStore.swift
//  tea
//
//  Created by Syber Expertise on 21/10/2022.
//

import Foundation

class AuthStore:ObservableObject{
    
    @Published var username : String = ""
    @Published var password : String = ""
    
    enum State:Equatable {
        case idle
        case loading
        case success
        case error(message:String)
    }
    
    @Published var state:State = .idle
}

extension AuthStore:AuthPresentDisplayLogic{
    func renderLoading() {
        print("loading")
        print("username:",self.username," password",self.password)
        self.state = .loading
    }
    
    func renderSuccess() {
        self.state = .success
    }
    
    func renderError(_ errorMessage: String) {
        self.state = .error(message: errorMessage)
    }
    
    
}

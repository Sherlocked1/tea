//
//  AuthServices.swift
//  tea
//
//  Created by Syber Expertise on 21/10/2022.
//

import Foundation

class AuthServices:AuthServicesProtocol {
    
    func loginUser(completion: @escaping afCallback) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            completion(nil,nil)
        }
    }
    
    
}

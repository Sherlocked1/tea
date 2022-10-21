//
//  NetworkClient.swift
//  tea
//
//  Created by Syber Expertise on 20/10/2022.
//

import Foundation
import Alamofire

typealias afCallback = ((Data?,Error?) -> Void)

class NetworkClient {
    static let main:NetworkClient = NetworkClient()
    
    func call(api:String,usingMethod method:HTTPMethod,withHeaders headers:[String:String],andParameters parameters:[String:Any],callback:@escaping afCallback){
        let httpHeaders = HTTPHeaders.init(headers)
        AF.request(api,method:method,parameters:parameters, headers:httpHeaders).response { data in
            let result = data.result
            switch (result) {
            case .success(let data):
                callback(data,nil)
                break
            case .failure(let error):
                callback(nil,error)
                break
                
            }
        }
    }
}

//
//  News.swift
//  tea
//
//  Created by Syber Expertise on 20/10/2022.
//

import Foundation

struct NewsDTO : Decodable {
    var title:String?
    var link :String?
    var image_url:String?
    var description:String?
}

struct responseDTO : Decodable {
    var status : String
    var results : [NewsDTO]
}


struct NewsVM:Identifiable {
    let id = UUID()
    var title:String
    var link :String
    var image_url:String
    var description:String
    
    static func mapFrom(_ dto:NewsDTO) -> NewsVM{
        return .init(title: dto.title ?? "", link: dto.link ?? "", image_url: dto.image_url ?? "", description: dto.description ?? "")
    }
}

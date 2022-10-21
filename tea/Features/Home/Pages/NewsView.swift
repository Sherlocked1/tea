//
//  NewsView.swift
//  tea
//
//  Created by Syber Expertise on 20/10/2022.
//

import SwiftUI

struct NewsView: View {
    
    var news : [NewsVM] = []
    
    var body: some View {
        List{
            ForEach(news,id: \.id) { newsData in
                NewsItem(data: .init(title: newsData.title, link: newsData.link, image_url: newsData.image_url, description: newsData.description))
                    .listRowInsets(EdgeInsets(.init(top: 5, leading: 0, bottom: 5, trailing: 0)))
                    .listRowBackground(Color.primaryColor)
                    
            }
        }
        .scrollContentBackground(.hidden)
        .background(Color.primaryColor)
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView(news: [])
    }
}

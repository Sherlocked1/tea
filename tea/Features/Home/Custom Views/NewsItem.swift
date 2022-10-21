//
//  NewsItem.swift
//  tea
//
//  Created by Syber Expertise on 20/10/2022.
//

import SwiftUI

struct NewsItem : View{
    
    var data    : NewsVM
    
    var body: some View {
        HStack(alignment:.top){
            if data.image_url != "" {
                AsyncImage(url: URL(string: data.image_url)){done in
                    if let image = done.image {
                        image
                            .resizable()
                            .scaledToFit()
                    }else {
                        ProgressView()
                    }
                }.frame(width: 120,height: 80)
            }
            VStack(alignment:.leading){
                Text(data.title)
                    .font(.title)
                    .lineLimit(2)
                Text(data.description)
                    .lineLimit(3)
                    .font(.caption)
            }
            Spacer()
            
        }
        .frame(maxWidth: .infinity)
        .padding(.all)
        .background(Color.secondaryColor)
        .foregroundColor(Color.primaryColor)
        .cornerRadius(10)
        .onTapGesture {
            guard let url = URL(string: data.link) else { return }
            UIApplication.shared.open(url)
        }
    }
}

struct NewsItem_Previews: PreviewProvider {
    static var previews: some View {
        let vm = NewsVM(title: "Title", link: "https://google.com", image_url: "https://static.wikia.nocookie.net/thewire/images/9/92/McNulty.jpg/revision/latest?cb=20070912201834", description: "description")
        
        NewsItem(data: vm)
    }
}

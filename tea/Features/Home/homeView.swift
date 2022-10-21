//
//  homeView.swift
//  tea
//
//  Created by Syber Expertise on 20/10/2022.
//

import SwiftUI
import OrderedCollections

var categories : OrderedDictionary = [
    "business":"bag.fill",
    "entertainment":"play.tv",
    "environment":"sun.min.fill",
    "food":"fork.knife.circle.fill",
    "health":"heart.text.square",
    "politics":"folder.badge.person.crop",
    "science":"sum",
    "sports":"sportscourt.fill",
    "technology":"externaldrive.connected.to.line.below",
    "top":"arrow.up",
    "world":"network",
]

struct homeView: View {
    @State var selectedCategory : String? = "business"
    @State var isLoading = true
    
    var presenter:NewsPresenterProtocol
    @EnvironmentObject var store:NewsStore
    
    init(presenter: NewsPresenterProtocol) {
        self.presenter = presenter
    }
    
    func chipClicked(title:String){
        if selectedCategory != title {
            selectedCategory = title
        }
        
        self.presenter.fetchNews(withCategory: selectedCategory!)
    }
    
    var body: some View {
        NavigationView {
            VStack{
                ScrollView(.horizontal,showsIndicators: false){
                    HStack(alignment:.top){
                        ForEach(Array(categories),id: \.key) { key,value in
                            Chip(isSelected: $selectedCategory, icon: Image(systemName: value), titleText: key,callBack: chipClicked)
                        }
                    }
                }
                .padding(.horizontal)
                switch (self.store.state) {
                case .loading:
                    ProgressView().frame(maxHeight: .infinity)
                case .success(let news):
                    NewsView(news: news)
                case .error(let errorMessage):
                    Text(errorMessage)
                case .idle:
                    Text("").frame(maxHeight: .infinity)
                }
            }
            .frame(maxHeight: .infinity)
            .background(Color.primaryColor)
        }
        .navigationTitle("Home")
        .onAppear{
            
        }
    }
}

struct homeView_Previews: PreviewProvider {
    static var previews: some View {
        let store = NewsStore()
        NavigationView {
            homeView(presenter: NewsPresenter(service: NewsServices(), delegate: store))
                .environmentObject(store)
        }
    }
}

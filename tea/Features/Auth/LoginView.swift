//
//  LoginView.swift
//  tea
//
//  Created by Syber Expertise on 20/10/2022.
//

import SwiftUI

struct LoginView: View {
    
    var presenter:AuthPresenterProtocol
    @EnvironmentObject var store:AuthStore
    
    init(presenter: AuthPresenterProtocol) {
        self.presenter = presenter
    }
    
    @State private var isPresented = true
    @State private var loggedIn = false
    
    let newsStore = NewsStore()
    
    func login(){
        print("logging in")
        self.presenter.login()
    }
    
    var body: some View {
        
        NavigationView{
            VStack{
                switch(store.state) {
                case .loading:
                    ProgressView()
                case .idle:
                    ScrollView{
                        VStack(spacing:20){
                            Image("login_draw")
                                .resizable().scaledToFit()
                                .frame(height: 200)
                            
                            TextField("Username", text: $store.username)
                                .padding(10)
                                .background(Color.primaryColor)
                                .foregroundColor(Color.secondaryColor)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.secondary, lineWidth: 1)
                                )
                                .font(.subheadline)
                                .textContentType(.username)
                            
                            SecureField("Password", text: $store.password)
                                .padding(10)
                                .background(Color.primaryColor)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.secondary, lineWidth: 1)
                                )
                                .font(.subheadline)
                                .textContentType(.password)
                            
                            Spacer().frame(height: 20)
                            
                            Button(action: login) {
                                Text("Login")
                                    .bold()
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity,minHeight: 50)
                            }
                            .background(.blue)
                            .cornerRadius(15)
                        }
                        .padding()
                    }.background(Color.primaryColor)
                    
                    
                case .error(let message):
                    Text(message)
                case .success:
                    Text("").onAppear{
                        loggedIn = true
                    }
                }
            }.navigate(
                to:homeView(presenter: NewsPresenter(service: NewsServices(), delegate: newsStore))
                    .environmentObject(newsStore),
                when:$loggedIn
            )
        }
        .foregroundColor(.secondaryColor)
        .navigationTitle("Login")
        .navigationBarTitleDisplayMode(.inline)
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        
        let store = AuthStore()
        
        NavigationView {
            LoginView(presenter: AuthPresenter(service: AuthServices(), delegate: store)
            ).environmentObject(store)
        }
    }
}

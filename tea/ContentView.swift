//
//  ContentView.swift
//  tea
//
//  Created by Syber Expertise on 20/10/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        var store = AuthStore()
        LoginView(presenter: AuthPresenter(service: AuthServices(), delegate: store)
        ).environmentObject(store)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

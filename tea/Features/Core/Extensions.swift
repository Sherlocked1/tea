//
//  Extensions.swift
//  tea
//
//  Created by Syber Expertise on 20/10/2022.
//

import Foundation
import SwiftUI

extension Color {
    static var primaryColor : Color = .init("Primary")
    static var secondaryColor : Color = .init("Secondary")
    static var tertiaryColor : Color = .init("Tertiary")
    static var customOrangeColor : Color = .init("Custom Orange")
    static var yellowColor : Color = .init("Yellow")
}

extension View {
    /// Navigate to a new view.
    /// - Parameters:
    ///   - view: View to navigate to.
    ///   - binding: Only navigates when this condition is `true`.
    func navigate<NewView: View>(to view: NewView, when binding: Binding<Bool>) -> some View {
        NavigationView {
            ZStack {
                self
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                
                NavigationLink(
                    destination: view
                        .navigationBarTitle("")
                        .navigationBarHidden(true),
                    isActive: binding
                ) {
                    EmptyView()
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

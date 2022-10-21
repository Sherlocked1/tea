//
//  Chip.swift
//  tea
//
//  Created by Syber Expertise on 20/10/2022.
//

import SwiftUI

struct Chip: View {
    @Binding var isSelected : String?
    var icon              : Image
    var titleText         : String
    var callBack          : (_ txt:String)->Void
    
    var body: some View {
        HStack{
            icon.font(.title3)
            Text(titleText).font(.title3).lineLimit(1)
        }
        .animation(.easeOut, value: isSelected)
        .padding(.all,10)
        .foregroundColor(isSelected == titleText ? .white : .blue)
        .background(isSelected == titleText ? Color.blue : Color.white)
        .cornerRadius(40)
        .overlay(
            RoundedRectangle(cornerRadius: 40)
                .stroke(Color.blue,lineWidth: 0)
        ).onTapGesture {
//            isSelected = titleText // toggle select - not selected
            callBack(titleText)
        }
        
    }
}

struct Chip_Previews: PreviewProvider {
    static var previews: some View {
        
        Chip(isSelected: Binding<String?>.constant(""), icon:Image(systemName: "pencil.circle"),titleText:"test") { txt in
            
        }
    }
}

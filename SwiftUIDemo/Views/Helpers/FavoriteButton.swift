//
//  FavoriteButton.swift
//  SwiftUIDemo
//
//  Created by dueda on 2021/5/28.
//

import SwiftUI

struct FavoriteButton: View {
    
    @Binding var  isSet: Bool
    
    var body: some View {
        Button(action: {
            isSet.toggle()
        }) {
            Image(systemName: isSet ? "star.fill" : "star")
                .foregroundColor(isSet ? .yellow : .gray)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}


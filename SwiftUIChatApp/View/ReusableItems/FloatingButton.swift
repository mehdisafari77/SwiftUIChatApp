//
//  FloatingButton.swift
//  SwiftUIChatApp
//  Created by Mehdi MMS on 19/08/2021.
//

import SwiftUI

struct FloatingButton: View {
    @Binding var show: Bool
    
    var body: some View {
        Button(action: { show.toggle() }, label: {
            Image(systemName: "square.and.pencil")
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
                .padding()
        })
        .background(Color(.systemBlue))
        .foregroundColor(.white)
        .clipShape(Circle())
        .padding()
        
    }
}

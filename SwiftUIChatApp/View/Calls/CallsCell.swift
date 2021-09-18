//
//  CallsCell.swift
//  SwiftUIChatApp
//
//  Created by Mehdi MMS on 05/08/2021.
//

import SwiftUI

struct CallsCell: View {
    var body: some View {
        
        VStack {
            HStack(alignment: .center) {
                
                VStack {
                    Image("lady2")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 64, height: 64)
                        .clipShape(Circle())
                        .padding(.leading)
                    
                }.padding([.top, .bottom])
                    
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Ariana Grande")
                        .font(.system(size: 14))
                    
                    HStack {
                        Image(systemName: "phone.fill.arrow.up.right")
                            .foregroundColor(.gray)
                        
                        Text("Outgoing")
                            .foregroundColor(.gray)
                            .font(.system(size: 12))
                    }
                    
                }
                Spacer()
                
                VStack {
                    
                    HStack {
                        
                        Text("Yesterday, 11:12")
                            .foregroundColor(.gray)
                            .font(.system(size: 12))
                        
                        Button(action: {"Info Button..."}, label: {
                            Image(systemName: "info.circle.fill")
                                .foregroundColor(.gray)
                        })
                    }
                }.padding(.trailing)
            }
            Divider()

        }
        
    }
}

struct CallsCell_Previews: PreviewProvider {
    static var previews: some View {
        CallsCell()
    }
}

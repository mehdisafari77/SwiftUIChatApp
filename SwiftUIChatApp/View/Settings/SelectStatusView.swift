//
//  StatusSelectorView.swift
//  SwiftUIChatApp
//
//  Created by Mehdi MMS on 05/08/2021.
//

import SwiftUI

struct SelectStatusView: View {
    @ObservedObject var viewModel: EditProfileViewModel
    
    var body: some View {
        ZStack(alignment: .leading) {
            Color(.systemGroupedBackground)
            
            
            ScrollView {
                VStack(alignment: .leading) {
                    
                    Text("CURRENTLY SET TO")
                        .foregroundColor(.gray)
                        .padding()
                    
                    StatusCell(status: viewModel.user.status)
                    
                    Text("SELECT YOUR STATUS")
                        .foregroundColor(.gray)
                        .padding()
                    
                    ForEach(UserStatus.allCases.filter({ $0 != .notConfigured }), id: \.self) { status in
                        Button(action: { viewModel.updateUserStatus(status) }, label: {
                            StatusCell(status: status)
                        })
                    }
                }
            }
        }
    }
}

struct StatusCell: View {
    let status: UserStatus
    
    var body: some View {
        VStack(spacing: 4) {
            HStack {
                Text(status.description)
                    .foregroundColor(.black)
                Spacer()
            }.padding(.horizontal)

        }
        .frame(height: 56)
        .background(Color.white)
    }
}

//struct SelectStatusView_Previews: PreviewProvider {
//    static var previews: some View {
//        SelectStatusView(status: .constant(.urgentCallsOnly))
//    }
//}

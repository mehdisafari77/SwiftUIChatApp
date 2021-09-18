//
//  NewMessageView.swift
//  SwiftUIChatApp
//
//  Created by Mehdi MMS on 07/08/2021.
//

import SwiftUI

struct NewMessageView: View {
    @State var searchText = ""
    @State var isEditing = false
    @Binding var show: Bool
    @Binding var startChat: Bool
    @Binding var user: User?
    @ObservedObject var viewModel = NewMessageViewModel(config: .chat)
    
    var body: some View {
        ScrollView {
            SearchBar(text: $searchText, isEditing: $isEditing)
                .onTapGesture {isEditing.toggle() }
                .padding()

            VStack(alignment: .leading) {
                ForEach(searchText.isEmpty ? viewModel.users : viewModel.filteredUsers(searchText)) { user in
                    HStack { Spacer() }
                    
                    Button(action: {
                        self.show.toggle()
                        self.startChat.toggle()
                        self.user = user
                    }, label: {
                        UserCell(user: user)
                    })
                }
            }.padding(.leading)
        }
    }
}

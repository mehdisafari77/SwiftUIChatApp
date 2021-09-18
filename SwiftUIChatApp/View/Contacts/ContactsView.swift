//
//  ContactsView.swift
//  SwiftUIChatApp
//
//  Created by Mehdi MMS on 05/08/2021.
//

import SwiftUI

struct ContactsView: View {
    @State var searchText = ""
    @State var inSearchMode = false

    var body: some View {
        
        
        ScrollView {
            SearchBar(text: $searchText, isEditing: $inSearchMode)
                .padding(.horizontal)

        }
    }
}

struct ContactsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsView()
    }
}

//            ZStack {
//                if inSearchMode {
//                    UserListView(viewModel: viewModel, searchText: $searchText)
//                } else {
//                    PostGridView(config: .explore)
//                }
//            }

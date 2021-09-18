//
//  CallsView.swift
//  SwiftUIChatApp
//
//  Created by Mehdi MMS on 05/08/2021.
//

import SwiftUI

struct CallsView: View {
    @State var searchText = ""
    @State var inSearchMode = false
    
    
    var body: some View {
        ScrollView {
            SearchBar(text: $searchText, isEditing: $inSearchMode)
                .padding(.horizontal)
            
            ZStack {
                VStack(spacing: 1) {
                    ForEach((0 ... 10), id: \.self) { _ in
                        CallsCell()
                    }
                }
            }
            
        }
    }
}

struct CallsView_Previews: PreviewProvider {
    static var previews: some View {
        CallsView()
    }
}

//            ZStack {
//                if inSearchMode {
//                    UserListView(viewModel: viewModel, searchText: $searchText)
//                } else {
//                    PostGridView(config: .explore)
//                }
//            }

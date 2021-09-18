//
//  ConversationsView.swift
//  SwiftUIChatApp
//
//  Created by Mehdi MMS on 03/08/2021.
//

import SwiftUI

struct ConversationsView: View {
    @State var isShowingNewMessageView = false
    @State var showChat = false
    @State var user: User?
    @ObservedObject var viewModel = ConversationsViewModel()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            
            if let user = user {
                NavigationLink(destination: LazyView(ChatView(user: user)),
                               isActive: $showChat,
                               label: {} )
            }
            
            ScrollView {
                VStack {
                    ForEach(viewModel.recentMessages) { message in
                        if let user = message.user {
                            NavigationLink(
                                destination:
                                    LazyView(ChatView(user: user))
                                    .onDisappear(perform: {
                                        viewModel.fetchRecentMessages()
                                    }),
                                label: {
                                    ConversationCell(viewModel: MessageViewModel(message: message))
                                })
                        }
                    }
                }.padding()
            }
            
            HStack {
                Spacer()
                
                FloatingButton(show: $isShowingNewMessageView)
                    .sheet(isPresented: $isShowingNewMessageView, content: {
                        NewMessageView(show: $isShowingNewMessageView,
                                       startChat: $showChat,
                                       user: $user)
                    })
            }
            .navigationTitle("Messages")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ConversationsView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationsView()
    }
}


//            ZStack {
//                if inSearchMode {
//                    UserListView(viewModel: viewModel, searchText: $searchText)
//                } else {
//                    PostGridView(config: .explore)
//                }
//            }

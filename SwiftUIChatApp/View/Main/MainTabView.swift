//
//  MainTabView.swift
//  SwiftUIChatApp
//
//  Created by Mehdi MMS on 03/08/2021.
//

import SwiftUI

struct MainTabView: View {
    @State private var selecetedIndex = 0
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        if let user = viewModel.currentUser {
            NavigationView {
                
                TabView(selection: $selecetedIndex) {
                    
                    CallsView()
                        .onTapGesture {
                            selecetedIndex = 0
                        }
                        .tabItem { Image(systemName: "phone")}
                        .tag(0)
                    
                    ContactsView()
                        .onTapGesture {
                            selecetedIndex = 1
                        }
                        .tabItem { Image(systemName: "rectangle.stack.person.crop")}
                        .tag(1)
                    
                    ConversationsView()
                        .onTapGesture {
                            selecetedIndex = 2
                        }
                        .tabItem { Image(systemName: "bubble.left")}
                        .tag(2)
                    
                   ChannelsView()
                        .onTapGesture {
                            selecetedIndex = 3
                        }
                        .tabItem { Image(systemName: "bubble.left.and.bubble.right")}
                        .tag(3)
                    
                    SettingsView(user: user)
                        .onTapGesture {
                            selecetedIndex = 4
                        }
                        .tabItem { Image(systemName: "gear")}
                        .tag(4)
                        
                    
                }
                .navigationTitle(tabTitle)
                
            }
        }
    }
    
    
    var tabTitle: String {
        switch selecetedIndex {
        case 0: return "Calls"
        case 1: return "Contacts"
        case 2: return "Conversations"
        case 3: return "Channels"
        case 4: return "Settings"
        default: return ""
        }
    }
}

//struct MainTabView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainTabView()
//    }
//}

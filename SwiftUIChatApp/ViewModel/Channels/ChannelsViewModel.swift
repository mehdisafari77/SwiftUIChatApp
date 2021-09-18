//
//  ChannelsViewModel.swift
//  SwiftUIChatApp
//
//  Created by Mehdi MMS on 30/07/2021.
//

import Foundation

class ChannelsViewModel: ObservableObject {
    @Published var channels = [Channel]()
    
    init() {
        fetchChannels()
    }
    
    func fetchChannels() {
        guard let uid = AuthViewModel.shared.currentUser?.id else { return }
        COLLECTION_CHANNELS.whereField("uids", arrayContains: uid).getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.channels = documents.compactMap({ try? $0.data(as: Channel.self) })
        }
    }
}

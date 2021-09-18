//
//  ChannelMessageViewModel.swift
//  SwiftUIChatApp
//
//  Created by Mehdi MMS on 30/07/2021.
//

import Foundation

struct ChannelMessageViewModel {
    let message: ChannelMessage
    
    var currentUid: String { return AuthViewModel.shared.userSession?.uid ?? "" }
    
    var isFromCurrentUser: Bool { return message.fromId == currentUid }
    
    var fullname: String {
        return message.user?.fullname ?? ""
    }
}

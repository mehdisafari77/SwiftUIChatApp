//
//  SettingsCellViewModel.swift
//  SwiftUIChatApp
//
//  Created by Mehdi MMS on 05/08/2021.
//

import SwiftUI

enum SettingsCellViewModel: Int, CaseIterable {
    case account
    case notifications
    case starredMessages
    case chats
    case privacyAndSecurity
    case storageAndData
    case language
    case help
    
    var title: String {
        switch self {
        case .account: return "Account"
        case .notifications: return "Notifications"
        case .starredMessages: return "Starred Messages"
        case .chats: return "Chats"
        case .privacyAndSecurity: return "Privacy & Security"
        case .storageAndData: return "Storage and Data"
        case .language: return "Language"
        case .help: return "Help"
            
        }
    }
    
    var imageName: String {
        switch self {
        case .account: return "key.fill"
        case .notifications: return "bell.badge.fill"
        case .starredMessages: return "star.fill"
        case .chats: return "message.fill"
        case .privacyAndSecurity: return "lock.fill"
        case .storageAndData: return "internaldrive.fill"
        case .language: return "t.bubble.fill"
        case .help: return "info.circle.fill"
            
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .account: return .blue
        case .notifications: return .red
        case .starredMessages: return .yellow
        case .chats: return .green
        case .privacyAndSecurity: return .orange
        case .storageAndData: return .purple
        case .language: return .gray
        case .help: return .pink
            
        }
    }
}


//
//  SelectableUser.swift
//  SwiftUIChatApp
//
//  Created by Mehdi MMS on 19/08/2021.
//

import Foundation

struct SelectableUser: Identifiable {
    var user: User
    var isSelected: Bool
    
    var id: String { return user.id ?? NSUUID().uuidString }
}

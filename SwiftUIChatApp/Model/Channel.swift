//
//  Channel.swift
//  SwiftUIChatApp//
//  Created by Mehdi MMS on 19/08/2021.
//

import FirebaseFirestoreSwift

struct Channel: Identifiable, Decodable {
    @DocumentID var id: String?
    var name: String
    var imageUrl: String?
    var uids: [String]
    var lastMessage: String
}

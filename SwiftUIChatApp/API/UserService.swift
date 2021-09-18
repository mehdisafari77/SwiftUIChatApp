//
//  UserService.swift
//  SwiftUIChatApp
//
//  Created by Mehdi MMS on 19/08/2021.
//

import Foundation

struct UserService {
    
    static func fetchUser(withUid uid: String, completion: @escaping(User) -> Void) {
        COLLECTION_USERS.document(uid).getDocument { snapshot, _ in
            guard let user = try? snapshot?.data(as: User.self) else { return }
            completion(user)
        }
    }
}

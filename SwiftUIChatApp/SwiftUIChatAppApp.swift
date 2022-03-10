
//  SwiftUIChatAppApp.swift
//  SwiftUIChatApp
//
//  Created by Mehdi MMS on 30/07/2021.



import SwiftUI
import Firebase

@main
struct SwiftUIChatAppApp: App {

    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AuthViewModel.shared)
        }
    }
}

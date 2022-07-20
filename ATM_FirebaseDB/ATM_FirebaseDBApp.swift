//
//  ATM_FirebaseDBApp.swift
//  ATM_FirebaseDB
//
//  Created by Grizzowl on 2022/07/20.
//

import SwiftUI
import FirebaseCore

@main
struct ATM_FirebaseDBApp: App {
    
    //Firebase setup
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

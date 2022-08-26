//
//  ATM_FirebaseDBApp.swift
//  ATM_FirebaseDB
//
//  Created by Grizzowl on 2022/07/20.
//

import SwiftUI
import FirebaseCore
import Firebase

@main
struct ATM_FirebaseDBApp: App {
    
    //Firebase setup
    init() {
        FirebaseApp.configure()
    }
    
    @StateObject var sessionService = UserSessionImp()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                switch sessionService.state {
                    case .loggedIn:
                    HomePageControllerView()
                            .environmentObject(sessionService)
                    case .loggedOut:
                    LoginView()
                    }
                
            }
        }
    }
}


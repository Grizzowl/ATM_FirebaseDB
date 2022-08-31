//
//  ATM_FirebaseDBApp.swift
//  ATM_FirebaseDB
//
//  Created by Grizzowl on 2022/07/20.
//

import SwiftUI
import FirebaseCore
import Firebase

// Firestore
@main
struct ATMApp: App {
    
    init() {
        FirebaseApp.configure()
    }
 
    @StateObject var userStateViewModel = SessionState()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ApplicationSwitcher()
            }
            .navigationViewStyle(.stack)
            .environmentObject(userStateViewModel)
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
    }
}

struct ApplicationSwitcher: View {
    
    @EnvironmentObject var vm: SessionState
    
    var body: some View {
        if (vm.isLoggedIn) {
            HomeScreenView()
        } else {
            LoginView()
        }
        
    }
}


/* //Auth View Manager
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
*/

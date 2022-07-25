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
//    init() {
//        FirebaseApp.configure()
//    }
    
    @StateObject var userStateViewModel = UserStateViewModel()
    
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
    
    @EnvironmentObject var vm: UserStateViewModel
    
    var body: some View {
        if (vm.isLoggedIn) {
            //HomeScreenView() [WIP] Set up a home screen for the user linked to firebase
        } else {
            LoginView()
        }
        
    }
}

//
//  SessionState.swift
//  ATM_FirebaseDB
//
//  Created by Grizzowl on 2022/08/30.
//

import Foundation

class SessionState: ObservableObject {
    
    @Published var isLoggedIn = false
    @Published var isBusy = false
    
    func signIn() {
            isLoggedIn = true
        }
    
    func signOut(){
            isLoggedIn = false
}

}

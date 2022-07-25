//
//  LoginModel.swift
//  ATM_FirebaseDB
//
//  Created by Grizzowl on 2022/07/22.
//

import Foundation


class UserStateViewModel: ObservableObject {
    
    @Published var isLoggedIn = false
    
    func signIn() {
        isLoggedIn = true
    }
    
    func signOut() {
        isLoggedIn = false
    }
}

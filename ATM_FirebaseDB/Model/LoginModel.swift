//
//  LoginModel.swift
//  ATM_FirebaseDB
//
//  Created by Grizzowl on 2022/07/22.
//

import Foundation
import FirebaseAuth


class UserStateViewModel: ObservableObject {
    
    let auth = Auth.auth()
    
    @Published var isLoggedIn = false
    @Published var signedIn = false
    
    func signIn() {
        isLoggedIn = true
    }
    
    func signOut() {
        isLoggedIn = false
    }
    
    func logIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { [self] result, err in
            if let err = err {
                print("Failed to login user:", err)
                return
            } else{
                self.signIn()
                print("Successfully logged in as user: \(result?.user.uid ?? "")")
                
            }
        }
    }
    
}



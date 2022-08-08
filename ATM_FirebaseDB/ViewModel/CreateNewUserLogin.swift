//
//  CreateNewUser.swift
//  ATM_FirebaseDB
//
//  Created by Grizzowl on 2022/08/05.
//

import Foundation
import FirebaseAuth
import Firebase
import FirebaseCore

class CreateNewUserLogin: ObservableObject {
    
    func createNewUser(email:String, password:String){
        
        Auth.auth().createUser(withEmail: email, password: password) {
            result, error in
            if let error = error {
                print("failed to create user:", error)
            }
        }
    }
    
}


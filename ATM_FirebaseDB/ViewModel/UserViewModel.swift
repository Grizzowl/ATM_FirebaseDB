//
//  UserViewModel.swift
//  ATM_FirebaseDB
//
//  Created by Grizzowl on 2022/08/04.
//

import Foundation
import Firebase
import FirebaseCore

class UserViewModel: ObservableObject {
    
    @Published var userAccount = [RegistrationDetails]()
    
    //get users info from db
    //home screen
    func getUserData() {
        
    }
    
    //update users info
    func updateData(updateUser: RegistrationDetails) {
       
    }
    
    //edit account info
    func editData(){
        
    }
    
    
    
}

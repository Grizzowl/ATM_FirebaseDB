//
//  RegistrationModel.swift
//  ATM_FirebaseDB
//
//  Created by Grizzowl on 2022/08/04.
//

import Foundation


struct RegistrationDetails: Identifiable {
    
    var id: String
    var name: String
    var surname: String
    var userIDNumber: String
    var telephone: String
    var dateOfBirth: Date
    
    var email: String
    var password: String
    
    var accountNumber: Int
}






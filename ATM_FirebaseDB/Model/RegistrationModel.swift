//
//  RegistrationModel.swift
//  ATM_FirebaseDB
//
//  Created by Grizzowl on 2022/08/04.
//

import Foundation
import Firebase
import FirebaseCore
import Combine

struct RegistrationDetails {
    
    var name: String
    var surname: String
    var userIDNumber: String
    var telephone: String
    var email: String
    var dateOfBirth: Date
    
    var username: String
    var password: String
    
    var accountNumber: String
    var balance: String
    var cardNumber: String
    var expDate: String
    var cvvNumber: String
    var transactionPaymentReference: String
    var transactionHistoryAmount: String
    var transactionHistorydate: Date
    
}






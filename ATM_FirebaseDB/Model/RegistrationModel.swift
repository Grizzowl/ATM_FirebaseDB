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
    var email: String
    var dateOfBirth: Date
    
    var username: String
    var password: String
    
    var accountNumber: Int
    var balance: Double
    var cardNumber: Int
    var expDate: String
    var cvvNumber: Int
    var transactionPaymentReference: String
    var transactionHistoryAmount: Double
    var transactionHistoryDate: Date
    
}






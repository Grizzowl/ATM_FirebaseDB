//
//  RegistrationModel.swift
//  ATM_FirebaseDB
//
//  Created by Grizzowl on 2022/08/04.
//

import Foundation

//User Info
struct RegistrationDetails {
    
    var name: String
    var surname: String
    var userIDNumber: String
    var telephone: String
    var dateOfBirth: Date
    
    var email: String
    var password: String
    
    var accountNumber: Int
}
//User Card Info
struct BankCardModel {
    
    var balance: Double
    var cardNumber: String
    var expDate: String
    var cvvNumber: String
    var transactionPaymentReference: String
    var transactionHistoryAmount: Double
    var transactionHistoryDate: String
}





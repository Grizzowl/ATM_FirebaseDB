//
//  BankCardModel.swift
//  ATM_FirebaseDB
//
//  Created by Grizzowl on 2022/08/15.
//

import Foundation

struct BankCardModel: Identifiable {
    
    var id: ObjectIdentifier
    var balance: Double
    var cardNumber: Int
    var expDate: String
    var cvvNumber: Int
    var transactionPaymentReference: String
    var transactionHistoryAmount: Double
    var transactionHistoryDate: Date
}

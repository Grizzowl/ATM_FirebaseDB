//
//  TransactionModel.swift
//  ATM_FirebaseDB
//
//  Created by Grizzowl on 2022/09/02.
//

import Foundation
import Firebase


struct TransactionHistoryModel {
    var username: String
    var transactionPaymentReference: String
    var transactionHistoryAmount: Double
    var transactionHistoryDate: String
}

enum UserTransactionHistoryKeys: String {
    case username
    case transactionPaymentReference
    case transactionHistoryAmount
    case transactionHistoryDate
}

protocol TransactionHandler {
    func logTransactionHistory(with transactionCredentials: TransactionHistoryModel)
}

final class TransactionServiceImp: TransactionHandler {
    
    func logTransactionHistory(with transactionCredentials: TransactionHistoryModel) {
        
        //ref to DB
        let db = Firestore.firestore()
        let userCredentialsPath = db
            .collection("UserTable").document(transactionCredentials.username)
            .collection("TransactionHistory")
        
        let transactionValues = [UserTransactionHistoryKeys.username.rawValue: transactionCredentials.username,
                          UserTransactionHistoryKeys.transactionPaymentReference.rawValue: transactionCredentials.transactionPaymentReference,
                          UserTransactionHistoryKeys.transactionHistoryAmount.rawValue: transactionCredentials.transactionHistoryAmount,
                          UserTransactionHistoryKeys.transactionHistoryDate.rawValue: transactionCredentials.transactionHistoryDate] as [String : Any]
        
        //add a doc to Path
        userCredentialsPath.addDocument(data: transactionValues) { error in
            
            //chack for error
            if error == nil {
                //no error
                //self.getTodoData()
            } else {
                //handle the error
            }
            
        }
        
    }
    
    
}

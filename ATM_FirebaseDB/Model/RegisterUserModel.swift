//
//  RegisterUserModel.swift
//  ATM_FirebaseDB
//
//  Created by Grizzowl on 2022/08/30.
//

import Foundation
import Firebase

struct RegistrationDetails {
    
    var name: String
    var surname: String
    var userIDNumber: String
    var telephone: String
    var dateOfBirth: String
    
    var email: String
    var username: String
    var password: String
    
    var accountNumber: String
}

struct BankCardModel {
    
    var username: String
    var balance: Double
    var cardNumber: String
    var expDate: String
    var cvvNumber: String

}

protocol RegistrationHandler {
    func registerNewUserCredentials(with userCredentials: RegistrationDetails)
    func registerNewUserCard(with cardCredentials: BankCardModel)
}

enum RegistrationUserKeys: String {
    
    case name
    case surname
    case userIDNumber
    case telephone
    case dateOfBirth
    case email
    case username
    case password
    case accountNumber
}

enum RegistrationUserCardKeys: String {
    
    case username
    case balance
    case cardNumber
    case expDate
    case cvvNumber
    
}
    // For later use
struct UserTransactionHistory {
    var transactionPaymentReference: String
    var transactionHistoryAmount: Double
    var transactionHistoryDate: String
}

enum UserTransactionHistoryKeys: String {
    case transactionPaymentReference
    case transactionHistoryAmount
    case transactionHistoryDate
}

final class RegistrationServiceImp: RegistrationHandler {
    
    
    
    func registerNewUserCredentials(with userCredentials: RegistrationDetails) {
        
        //get ref to DB
        let db = Firestore.firestore()
        let userCredentialsPath = db
            .collection("UserTable").document(userCredentials.username)
            .collection("UserProfile")
        
        let credentialValues = [RegistrationUserKeys.name.rawValue: userCredentials.name,
                                RegistrationUserKeys.surname.rawValue: userCredentials.surname,
                                RegistrationUserKeys.userIDNumber.rawValue: userCredentials.userIDNumber,
                                RegistrationUserKeys.telephone.rawValue: userCredentials.telephone,
                                RegistrationUserKeys.dateOfBirth.rawValue: userCredentials.dateOfBirth,
                                RegistrationUserKeys.email.rawValue: userCredentials.email,
                                RegistrationUserKeys.username.rawValue: userCredentials.username,
                                RegistrationUserKeys.password.rawValue: userCredentials.password,
                                RegistrationUserKeys.accountNumber.rawValue: userCredentials.accountNumber] as [String : Any]
        
        //add a doc to
        userCredentialsPath.addDocument(data: credentialValues) { error in
            
            //chack for error
            if error == nil {
                //no error
                //self.getTodoData()
            } else {
                //handle the error
            }
            
        }
        
    }
    
    func registerNewUserCard(with cardCredentials: BankCardModel) {
        
        //get ref to DB
        let db = Firestore.firestore()
        let userCredentialsPath = db
            .collection("UserTable").document(cardCredentials.username)
            .collection("UserCard")
        
        let cardValues = [RegistrationUserCardKeys.username.rawValue: cardCredentials.username,
                          RegistrationUserCardKeys.balance.rawValue: cardCredentials.balance,
                          RegistrationUserCardKeys.cardNumber.rawValue: cardCredentials.cardNumber,
                          RegistrationUserCardKeys.expDate.rawValue: cardCredentials.expDate,
                          RegistrationUserCardKeys.cvvNumber.rawValue: cardCredentials.cvvNumber] as [String : Any]
        
        //add a doc to
        userCredentialsPath.addDocument(data: cardValues) { error in
            
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

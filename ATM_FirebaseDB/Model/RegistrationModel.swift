//
//  RegistrationModel.swift
//  ATM_FirebaseDB
//
//  Created by Grizzowl on 2022/08/04.
//

import Foundation
import Combine
import Firebase
import FirebaseDatabase

//User Info
struct RegistrationDetails {
    
    var name: String
    var surname: String
    var userIDNumber: String
    var telephone: String
    var dateOfBirth: Date
    
    var email: String
    var password: String
    
    var accountNumber: String
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

protocol RegistrationHandler {
    func registerNewUserDetails(with userCredentials: RegistrationDetails, with cardCredentials: BankCardModel) -> AnyPublisher<Void, Error>
    
}

enum RegistrationUserKeys: String {
    
    case name
    case surname
    case userIDNumber
    case telephone
    case dateOfBirth
    case email
    case password
    case accountNumber
}

enum RegistrationUserCardKeys: String {
    
    case balance
    case cardNumber
    case expDate
    case cvvNumber
    case transactionPaymentReference
    case transactionHistoryAmount
    case transactionHistoryDate
}

final class RegistrationUserImpl: RegistrationHandler {
    
    //Reg new user info
    func registerNewUserDetails(with userCredentials: RegistrationDetails, with cardCredentials: BankCardModel) -> AnyPublisher<Void, Error> {
        
        Deferred {
            
            Future { promise in
                
                Auth.auth().createUser(withEmail: userCredentials.email,
                                       password: userCredentials.password) { res, error in
                    
                    //fail
                    if let err = error {
                        promise(.failure(err))
                    } else {
                        //pass
                        if let uid = res?.user.uid {
                            //user info
                            let userValues = [RegistrationUserKeys.name.rawValue: userCredentials.name,
                                              RegistrationUserKeys.surname.rawValue: userCredentials.surname,
                                              RegistrationUserKeys.userIDNumber.rawValue: userCredentials.userIDNumber,
                                              RegistrationUserKeys.telephone.rawValue: userCredentials.telephone,
                                              RegistrationUserKeys.dateOfBirth.rawValue: userCredentials.dateOfBirth,
                                              RegistrationUserKeys.email.rawValue: userCredentials.email,
                                              RegistrationUserKeys.password.rawValue: userCredentials.password,
                                              RegistrationUserKeys.accountNumber.rawValue: userCredentials.accountNumber] as [String : Any]
                            
                            Database
                                .database()
                                .reference()
                                .child("users_table")
                                .child(uid)
                                .updateChildValues(userValues) { error, ref in
                                    
                                    if let err = error {
                                        promise(.failure(err))
                                    } else {
                                        promise(.success(()))
                                    }
                                }
                        }
                        if let uid = res?.user.uid {
                            //user card
                            let userCardValues = [RegistrationUserCardKeys.balance.rawValue: cardCredentials.balance,
                                                  RegistrationUserCardKeys.cardNumber.rawValue: cardCredentials.cardNumber,
                                                  RegistrationUserCardKeys.expDate.rawValue: cardCredentials.expDate,
                                                  RegistrationUserCardKeys.cvvNumber.rawValue: cardCredentials.cvvNumber,
                                                  RegistrationUserCardKeys.transactionPaymentReference.rawValue: cardCredentials.transactionPaymentReference,
                                                  RegistrationUserCardKeys.transactionHistoryAmount.rawValue: cardCredentials.transactionHistoryAmount,
                                                  RegistrationUserCardKeys.transactionHistoryDate.rawValue: cardCredentials.transactionHistoryDate] as [String : Any]
                            
                            Database
                                .database()
                                .reference()
                                .child("card_table")
                                .child(uid)
                                .updateChildValues(userCardValues) { error, ref in
                                    
                                    if let err = error {
                                        promise(.failure(err))
                                    } else {
                                        promise(.success(()))
                                    }
                                }
                        }
                    }
                }
            }
        }
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
    }
    
}

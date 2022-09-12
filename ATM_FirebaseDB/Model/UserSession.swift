//
//  SessionState.swift
//  ATM_FirebaseDB
//
//  Created by Grizzowl on 2022/08/30.
//

import Foundation
import Firebase

enum SessionState {
    case loggedIn
    case loggedOut
}

struct UserSessionDetails {
    let name: String
    let surname: String
    let email: String
    let username: String
    let password: String
    let accountNumber: String
}

struct UserSessionCardDetails {
    let balance: Double
    let cardNumber: String
    let expDate: String
    let cvvNumber: String
}

struct UserSessionTransactionHistory {
    let transactionPaymentReference: String
    let transactionHistoryAmount: Double
    let transactionHistoryDate: String
}

protocol SessionDetailsHandler {
    var state: SessionState { get }
    var userDetails: UserSessionDetails? { get }
    var userCardDetails: UserSessionCardDetails? { get }
    init()
    func logIn()
    func logout()
}

final class UserSessionImp: SessionDetailsHandler, ObservableObject {

    @Published var state: SessionState = .loggedOut

    @Published var userDetails: UserSessionDetails?
    @Published var userCardDetails: UserSessionCardDetails?
    
    func logIn() {
        self.state = .loggedIn
    }
    
    func logout() {
        self.state = .loggedOut
    }
    
    init() {
        setupObservations()
        setupCardObservations()
    }
    
    func setupObservations() {
        //link to login for db ref
        let db = Firestore.firestore()
        db.collection("UserTable").document("Bob123")
            .collection("UserProfile").document("Bob123_UserProfile").getDocument { snapshot, error in
                
                // Check for errors
                if error == nil {
                   
                    if let snapshot = snapshot {
                        
                        // Update the list property in the main thread
                        DispatchQueue.main.async {
                            
                            // Get all the documents and create Todos
                            self.userDetails = snapshot.data().map { d in
                                
                                // Create a Todo item for each document returned
                                return UserSessionDetails(name: d["name"] as? String ?? "",
                                                          surname: d["surname"] as? String ?? "",
                                                          email: d["email"] as? String ?? "",
                                                          username: d["username"] as? String ?? "",
                                                          password: d["password"] as? String ?? "",
                                                          accountNumber: d["accountNumber"] as? String ?? "")
                            }
                        }
                        
                        
                    }
                }
                else {
                    // Handle the error
                }
            }
    }
    
    func setupCardObservations() {
        //link to login for db ref
        let db = Firestore.firestore()
        db.collection("UserTable").document("Bob123")
            .collection("UserCard").document("Bob123_UserCard").getDocument { snapshot, error in
                
                // Check for errors
                if error == nil {
                    // No errors
                    
                    if let snapshot = snapshot {
                        
                        // Update the list property in the main thread
                        DispatchQueue.main.async {
                            
                            // Get all the documents and create Todos
                            self.userCardDetails = snapshot.data().map { d in
                                
                                // Create a Todo item for each document returned
                                return UserSessionCardDetails(balance: d["balance"] as? Double ?? 0,
                                                              cardNumber: d["cardNumber"] as? String ?? "",
                                                              expDate: d["expDate"] as? String ?? "",
                                                              cvvNumber: d["cvvNumber"] as? String ?? "")
                            }
                        }
                        
                        
                    }
                }
                else {
                    // Handle the error
                }
            }
    }
    
}

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
        
        let dbUsers = Firestore.firestore()
        
        //get user ID to show info
        dbUsers.collection("rwvoUWCnLYyAMX24hYOX-ADMIN").getDocuments { snapshot, error in
            
            if error == nil {
                if let snapshot = snapshot {
                    DispatchQueue.main.async {
                        self.userAccount = snapshot.documents.map { d in
                            
                            return RegistrationDetails(id: d.documentID,
                                                       name: d["name"] as? String ?? "",
                                                       surname: d["surname"] as? String ?? "",
                                                       userIDNumber: d["userIDNumber"] as? String ?? "",
                                                       telephone: d["telephone"] as? String ?? "",
                                                       email: d["email"] as? String ?? "",
                                                       dateOfBirth: d["dateOfBirth"] as? Date ?? Date(timeIntervalSince1970: 0),
                                                       username: d["username"] as? String ?? "",
                                                       password: d["password"] as? String ?? "",
                                                       accountNumber: d["accountNumber"] as? Int ?? 0,
                                                       balance: d["balance"] as? Double ?? 0,
                                                       cardNumber: d["cardNumber"] as? Int ?? 0,
                                                       expDate: d["expDate"] as? String ?? "",
                                                       cvvNumber: d["cvvNumber"] as? Int ?? 0,
                                                       transactionPaymentReference: d["transactionPaymentReference"] as? String ?? "",
                                                       transactionHistoryAmount: d["transactionHistoryAmount"] as? Double ?? 0,
                                                       transactionHistoryDate: d["transactionHistoryDate"] as? Date ?? Date(timeIntervalSince1970: 0)
                            )
                            
                        }
                    }
                }
            }
            
        }
        
    }
    
    //update users info
    func updateData(updateUser: RegistrationDetails) {
       
    }
    
    //edit account info
    func editData(){
        
    }
    
    
    
}

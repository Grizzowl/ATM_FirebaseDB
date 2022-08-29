//
//  UserState.swift
//  ATM_FirebaseDB
//
//  Created by Grizzowl on 2022/07/22.
//
/*
import Foundation
import FirebaseAuth
import FirebaseDatabase
import Combine

enum SessionState {
    case loggedIn
    case loggedOut
}

struct UserSessionDetails {
    let name: String
    let surname: String
    let email: String
    let accountNumber: String
}

protocol SessionService {
    var state: SessionState { get }
    var userDetails: UserSessionDetails? { get }
    init()
    func logout()
}

final class UserSessionImp: SessionService, ObservableObject {
    
    @Published var state: SessionState = .loggedOut
    @Published var userDetails: UserSessionDetails?
    
    private var handler: AuthStateDidChangeListenerHandle?
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        retrieveUserDetails()
    }
    
    deinit {
        guard let handler = handler else { return }
        Auth.auth().removeStateDidChangeListener(handler)
        print("deinit SessionServiceImpl")
    }
    
    func logout() {
        try? Auth.auth().signOut()
    }
}

private extension UserSessionImp {
    //split func for user and card
    func retrieveUserDetails() {
        
        handler = Auth
            .auth()
            .addStateDidChangeListener { [weak self] _,_ in
                guard let self = self else { return }
                
                let currentUser = Auth.auth().currentUser
                self.state = currentUser == nil ? .loggedOut : .loggedIn
                
                if let uid = currentUser?.uid {
                    
                    Database
                        .database()
                        .reference()
                        .child("users")
                        .child(uid)
                        .observe(.value) { [weak self] snapshot in
                            
                            guard let self = self,
                                  let value = snapshot.value as? NSDictionary,
                                  let name = value[RegistrationUserKeys.name.rawValue] as? String,
                                  let surname = value[RegistrationUserKeys.surname.rawValue] as? String,
                                  let email = value[RegistrationUserKeys.email.rawValue] as? String,
                                  let accountNumber = value[RegistrationUserKeys.accountNumber.rawValue] as? String else {
                                return
                            }

                            DispatchQueue.main.async {
                                self.userDetails = UserSessionDetails(name: name,
                                                                      surname: surname,
                                                                      email: email,
                                                                      accountNumber: accountNumber)
                            }
                        }
                }
            }
    }
}
*/


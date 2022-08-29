//
//  UserLoginModel.swift
//  ATM_FirebaseDB
//
//  Created by Grizzowl on 2022/08/25.
//
/*
import Foundation
import Combine
import Firebase

protocol LoginService {
    func login(with credentials: UserLoginCredentials) -> AnyPublisher<Void, Error>
}

struct UserLoginCredentials {
    var email: String
    var password: String
}

final class LoginServiceImp: LoginService {
    
    func login(with credentials: UserLoginCredentials) -> AnyPublisher<Void, Error> {
        
        Deferred {
            
            Future { promise in
                
                Auth
                    .auth()
                    .signIn(withEmail: credentials.email,
                            password: credentials.password) { res, error in
                        
                        if let err = error {
                            promise(.failure(err))
                        } else {
                            promise(.success(()))
                        }
                        
                    }
                
            }
        }
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
    }
}
*/

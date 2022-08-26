//
//  ResetPassword.swift
//  ATM_FirebaseDB
//
//  Created by Grizzowl on 2022/08/25.
//

import Foundation
import Combine
import Firebase

protocol ResetPasswordService {
    func sendPasswordResetRequest(to email: String) -> AnyPublisher<Void, Error>
}

final class ResetPasswordServiceImp: ResetPasswordService {
    
    func sendPasswordResetRequest(to email: String) -> AnyPublisher<Void, Error> {
        
        Deferred {
            
            Future { promise in
                Auth
                    .auth()
                    .sendPasswordReset(withEmail: email) { error in
                        
                        if let
                            err = error {
                            promise(.failure(err))
                        } else {
                            promise(.success(()))
                        }
                    }
            }
        }
        .eraseToAnyPublisher()
    }
}

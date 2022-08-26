//
//  ResetPasswordViewModel.swift
//  ATM_FirebaseDB
//
//  Created by Grizzowl on 2022/08/25.
//

import Foundation
import Combine

protocol ResetPasswordViewModel {
    var service: ResetPasswordService { get }
    var email: String { get }
    init (service: ResetPasswordService)
    func sendPasswordResetRequest()
}

final class ResetPasswordViewModelImp: ObservableObject, ResetPasswordViewModel {
    
    let service: ResetPasswordService
    @Published var email: String = ""
    
    private var subscriptions = Set<AnyCancellable>()
    
    init(service: ResetPasswordService) {
        self.service = service
    }
    
    func sendPasswordResetRequest() {
        service
            .sendPasswordResetRequest(to: email)
            .sink { res in
                switch res {
                case .failure(let err):
                    print("Failed: \(err)")
                default: break
                }
            } receiveValue: {
                print("Sending Request")
            }
            .store(in: &subscriptions)
    }
}


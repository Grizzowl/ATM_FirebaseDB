//
//  LoginViewModel.swift
//  ATM_FirebaseDB
//
//  Created by Grizzowl on 2022/08/24.
//
/*
import Foundation
import Combine
import SwiftUI

protocol LoginViewModel {
    func login()
    var loginUser: LoginService { get }
    var state: LoginState { get }
    var hasError: Bool { get }
    var loginDetails: UserLoginCredentials { get }
    init(service: LoginService)
}

enum LoginState {
    case successfullyLoggedIn
    case failed(error: Error)
    case na
}

final class LoginViewModelImp: ObservableObject, LoginViewModel {
    
    let loginUser: LoginService
    @Published var state: LoginState = .na
    @Published var loginDetails: UserLoginCredentials = UserLoginCredentials(email:"",
                                                                             password:"")
    
    @Published var hasError: Bool = false
    
    private var subscriptions = Set<AnyCancellable>()
    
    init(service: LoginService) {
        self.loginUser = service
        setupErrorSubscription()
    }
    
    func login() {
        loginUser
            .login(with: loginDetails)
            .sink { res in
                switch res {
                case .failure(let err):
                    self.state = .failed(error: err)
                default: break
                }
            } receiveValue: { [weak self] in
                self?.state = .successfullyLoggedIn
            }
            .store(in: &subscriptions)
    }
}

private extension LoginViewModelImp {
    
    func setupErrorSubscription() {
        $state
            .map { state -> Bool in
                switch state {
                case .successfullyLoggedIn,
                        .na:
                    return false
                case .failed:
                    return true
                }
            }
            .assign(to: &$hasError)
    }
}
*/

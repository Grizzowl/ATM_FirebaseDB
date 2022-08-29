//
//  RegisterNewUserViewModel.swift
//  ATM_FirebaseDB
//
//  Created by Grizzowl on 2022/08/16.
//
/*
import Foundation
import Combine

enum RegistrationState {
    case successfullyRegistered
    case failed(error: Error)
    case na
}

protocol RegistrationViewModel {
    func createNewUser()
    var serviceHandler: RegistrationHandler { get }
    var state: RegistrationState { get }
    var hasError: Bool { get }
    var newUser: RegistrationDetails { get }
    var newUserCard: BankCardModel { get }
    init(service: RegistrationHandler)
}

final class RegistrationViewModelImp: ObservableObject, RegistrationViewModel {
    
    var affm = AutoFillFuncModel()
    
    let serviceHandler: RegistrationHandler
    @Published var state: RegistrationState = .na
    @Published var newUser = RegistrationDetails(name: "BOB",
                                                 surname: "BOBSIN",
                                                 userIDNumber: "112233445566",
                                                 telephone: "+27151515",
                                                 dateOfBirth: "12/05/22",
                                                 email: "",
                                                 password: "",
                                                 accountNumber: "1212121212") //auto gen
    
    @Published var newUserCard = BankCardModel( balance: 0,
                                                cardNumber: "", //auto gen
                                                expDate: "", //auto gen
                                                cvvNumber: "", //auto gen
                                                transactionPaymentReference: "",
                                                transactionHistoryAmount: 0,
                                                transactionHistoryDate: "")
    @Published var hasError: Bool = false
    
    private var subscriptions = Set<AnyCancellable>()
    
    init(service: RegistrationHandler) {
        self.serviceHandler = service
        setupErrorSubscription()
    }
    
    func createNewUser() {
        
        serviceHandler
            .registerNewUserDetails(with: newUser, with: newUserCard)
        // .sink    This method creates the subscriber and immediately requests an unlimited number of values, prior to returning the subscriber.
        //          The return value should be held, otherwise the stream will be canceled.
            .sink { [weak self] res in
                
                switch res {
                case .failure(let error):
                    self?.state = .failed(error: error)
                default: break
                }
            } receiveValue: { [weak self] in
                self?.state = .successfullyRegistered
            }
            .store(in: &subscriptions)
    }
    
}

private extension RegistrationViewModelImp {
    
    func setupErrorSubscription() {
        $state
            .map { state -> Bool in
                switch state {
                case .successfullyRegistered,
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

//
//  RegisterUserViewModel.swift
//  ATM_FirebaseDB
//
//  Created by Grizzowl on 2022/08/30.
//

import Foundation

protocol RegistrationViewModel {
    func create()
    var service: RegistrationHandler { get }
    var newUser: RegistrationDetails { get }
    var newUserCard: BankCardModel { get }
    init(service: RegistrationHandler)
}

final class RegistrationViewModelImp: ObservableObject, RegistrationViewModel {
    
    let service: RegistrationHandler
    @Published var newUser = RegistrationDetails(name: "BOB",
                                                 surname: "BOBSIN",
                                                 userIDNumber: "112233445566",
                                                 telephone: "+27151515",
                                                 dateOfBirth: "12/05/22",
                                                 email: "",
                                                 username:"Bob123",
                                                 password: "",
                                                 accountNumber: "\(2596) \(Int.random(in: 1000...9999)) \(Int.random(in: 100...999))") //auto gen
    
    @Published var newUserCard = BankCardModel(username: "Bob123",
                                               balance: 0,
                                               cardNumber: "\(4550) \(Int.random(in: 1000...9999)) \(Int.random(in: 1000...9999)) \(Int.random(in: 1000...9999))", //auto gen
                                               expDate: "", //auto gen
                                               cvvNumber: "\(Int.random(in: 100...999))") //auto gen
     
    init(service: RegistrationHandler) {
        self.service = service
    }
    
    func create() {
                
        service
            .registerNewUserCredentials(with: newUser)
        
        service
            .registerNewUserCard(with: newUserCard)
            
    }
    
}

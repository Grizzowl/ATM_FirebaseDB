//
//  RegisterUserViewModel.swift
//  ATM_FirebaseDB
//
//  Created by Grizzowl on 2022/08/30.
//

import Foundation
import Firebase
import SwiftUI


protocol RegistrationViewModel {
    func createNewUser()
    var service: RegistrationHandler { get }
    var newUser: RegistrationDetails { get }
    var newUserCard: BankCardModel { get }
    init(service: RegistrationHandler)
}

final class RegistrationViewModelImp: ObservableObject, RegistrationViewModel {
    
    @Published var errorRegNewUser = false
    
    @Published var presentAlert = false
    @Published var successAlert = false
    @Published var nameInputError: Bool = false
    @Published var surnameInputError: Bool = false
    @Published var idInputError: Bool = false
    @Published var telephoneInputError: Bool = false
    @Published var emailInputError: Bool = false
    
    let service: RegistrationHandler
    @Published var newUser = RegistrationDetails(name: "",
                                                 surname: "",
                                                 userIDNumber: "",
                                                 telephone: "",
                                                 dateOfBirth: "",
                                                 email: "",
                                                 username:"Bob123",
                                                 password: "Bob123",
                                                 accountNumber: "\(2596) \(Int.random(in: 1000...9999)) \(Int.random(in: 100...999))") //auto gen
    
    @Published var newUserCard = BankCardModel(username: "Bob123",
                                               balance: 69,
                                               cardNumber: "\(4550) \(Int.random(in: 1000...9999)) \(Int.random(in: 1000...9999)) \(Int.random(in: 1000...9999))", //auto gen
                                               expDate: "05/29", //auto gen
                                               cvvNumber: "\(Int.random(in: 100...999))") //auto gen
    
    init(service: RegistrationHandler) {
        self.service = service
    }
    
    func createNewUser() {
        
        let db = Firestore.firestore()
        let userCredentialsPath = db
            .collection("UserTable").document(newUser.username)
            .collection("UserProfile").document("\(newUser.username)_UserProfile")
        
        userCredentialsPath
            .getDocument { (document, error) in
                debugPrint(document?.exists)
                if document?.exists ?? false {
                    // EXIST
                } else {
                    self.service
                        .registerNewUserCredentials(with: self.newUser)
                    
                    self.service
                        .registerNewUserCard(with: self.newUserCard)
                    
                }
            }
    }
    
    func validateUserInput () {
        
        nameInputError = false
        surnameInputError = false
        idInputError = false
        telephoneInputError = false
        emailInputError = false
        
        if newUser.name == "" {
            nameInputError = true
        }
        if newUser.surname == "" {
            surnameInputError = true
        }
        if newUser.email == "" {
            emailInputError = true
        }
        if newUser.userIDNumber == "" {
            idInputError = true
        }
        if newUser.telephone == "" {
            telephoneInputError = true
        }
       
        
        if nameInputError == true || surnameInputError == true || idInputError == true || telephoneInputError == true || emailInputError == true {
            presentAlert = true
        } else {
            //no input error
            presentAlert = false
            successAlert = true
            createNewUser()
        }
        
    }
    
}

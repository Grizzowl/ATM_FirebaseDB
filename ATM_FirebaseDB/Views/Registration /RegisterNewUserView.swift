//
//  RegisterNewUserView.swift
//  ATM_FirebaseDB
//
//  Created by Grizzowl on 2022/07/21.
//

import SwiftUI

struct RegisterNewUserView: View {
    /* Firebase-Auth*
     @StateObject private var regVM = RegistrationViewModelImp(
     service: RegistrationUserImpl()
     )
     */
    
    @StateObject private var regVM = RegistrationViewModelImp(
        service: RegistrationServiceImp()
    )
    
    @State private var regSuccess = false
    
    @State private var dateOfBirth = Date()
    @State private var getdateOfBirth = ""
    var formattedDate: DateFormatter {
        let formattedDateOfBirth = DateFormatter()
        formattedDateOfBirth.dateStyle = .long
        return formattedDateOfBirth
    }
    
    @State private var showCreatePasswordField = false
    
    let darkGreen = Color("DarkGreen")
    let lightGreen = Color("LightGreen")
    let gold = Color("Gold")
    
    //add views to a controller view to handle reg and sign up
   
    var body: some View {
       
            VStack {
                Text("Express Registration")
                    .font(.title)
                
                List {
                    Group {
                        VStack {
                            
                            Group{
                                HStack{
                                    Text("First Name")
                                        .foregroundColor(regVM.nameInputError ? Color.red : .black)
                                    Image(systemName: "exclamationmark")
                                        .foregroundColor(regVM.nameInputError ? Color.red : .clear)
                                }
                                //TextField("Name", text: $regVM.newUser.name) Firebase-Auth*
                                TextField("First Name", text: $regVM.newUser.name)
                                    .disableAutocorrection(true)
                            }
                            .padding()
                        }
                        
                        Group {
                            VStack {
                                HStack{
                                    Text("Surname")
                                        .foregroundColor(regVM.surnameInputError ? Color.red : .black)
                                    Image(systemName: "exclamationmark")
                                        .foregroundColor(regVM.surnameInputError ? Color.red : .clear)
                                }
                                //TextField("Surname", text: $regVM.newUser.surname) Firebase-Auth*
                                TextField("Surname", text: $regVM.newUser.surname)
                                    .disableAutocorrection(true)
                            }
                            .padding()
                        }
                        
                        Group {
                            VStack {
                                HStack{
                                    //update error binding
                                    Text("E-mail")
                                        .foregroundColor(regVM.emailInputError ? Color.red : .black)
                                    Image(systemName: "exclamationmark")
                                        .foregroundColor(regVM.emailInputError ? Color.red : .clear)
                                }
                                //TextField("Name", text: $regVM.newUser.name) Firebase-Auth*
                                TextField("xxxx@email.com", text: $regVM.newUser.email)
                                    .disableAutocorrection(true)
                                    .autocapitalization(.none)
                            }
                            .padding()
                        }
                        
                        Group {
                            VStack {
                                HStack{
                                    Text("ID number")
                                        .foregroundColor(regVM.idInputError ? Color.red : .black)
                                    Image(systemName: "exclamationmark")
                                        .foregroundColor(regVM.idInputError ? Color.red : .clear)
                                }
                                //TextField("Your ID number", text: $regVM.newUser.userIDNumber) Firebase-Auth*
                                TextField("Your ID number", text: $regVM.newUser.userIDNumber)
                                    .disableAutocorrection(true)
                            }
                            .padding()
                        }
                        
                        Group {
                            VStack {
                                HStack{
                                    Text("Telephone number")
                                        .foregroundColor(regVM.telephoneInputError ? Color.red : .black)
                                    Image(systemName: "exclamationmark")
                                        .foregroundColor(regVM.telephoneInputError ? Color.red : .clear)
                                }
                                HStack {
                                    Text("+27")
                                    Spacer()
                                    //TextField("xx-xxx-xxxx", text: $regVM.newUser.telephone) Firebase-Auth*
                                    TextField("xx-xxx-xxxx", text: $regVM.newUser.telephone)
                                        .disableAutocorrection(true)
                                }
                            }
                            .padding()
                        }
                        
                        Group {
                            //
                            VStack {
                                Text("Date of Birth") //add logic to stop user from adding a birthday thats younger than 18 or before current day
                                HStack {
                                    //
                                    DatePicker(
                                        "\(formattedDate.string(from: dateOfBirth))",
                                        selection: /*$regVM.newUser.dateOfBirth*/$dateOfBirth, //make a func that takes date input and returns foramtted date string
                                        displayedComponents: [.date]
                                    )
                                }
                                
                            }
                            .padding()
                        }
                    }
                    
                    //Firebase Auth code
                    Group {
                        /* Firebase-Auth*
                         Group {
                         Text("Enter Your Email")
                         .frame(width: 270, height: 5)
                         .keyboardType(.emailAddress)
                         .padding()
                         
                         TextField("Email Address", text: $regVM.newUser.email)
                         .padding()
                         .frame(width: 300, height: 50)
                         .background(Color.black.opacity(0.05))
                         .cornerRadius(15)
                         .padding(1)
                         
                         Rectangle()
                         .fill(darkGreen)
                         .frame(width: 350, height: 1, alignment: .center)
                         .padding(.leading, 15.5)
                         
                         //password login
                         Text("Please Create A Password")
                         .frame(width: 270, height: 5)
                         .padding()
                         
                         HStack{
                         ZStack{
                         if showCreatePasswordField == false {
                         SecureField("Password", text: $regVM.newUser.password)
                         .padding()
                         .frame(width: 300, height: 50)
                         .background(Color.black.opacity(0.05))
                         .cornerRadius(15)
                         .padding(1)
                         
                         } else {
                         TextField("Password", text: $regVM.newUser.password)
                         .padding()
                         .frame(width: 300, height: 50)
                         .background(Color.black.opacity(0.05))
                         .cornerRadius(15)
                         .padding(1)
                         
                         }
                         
                         }
                         
                         }.overlay(alignment: .trailing){
                         Image(systemName: showCreatePasswordField ? "eye": "eye.slash")
                         .onTapGesture {
                         showCreatePasswordField.toggle()
                         }
                         .padding()
                         }
                         }
                         */
                    }
                    
                    // add a navlink to a PDF of the privacy policy and T&Cs +make both checkboxes mandatory
                    //grey out button if both are not clicked
                    HStack{
                        Image(systemName: regVM.termsAndConditionsCheckbox ? "checkmark.square.fill" : "square")
                            .foregroundColor(regVM.termsAndConditionsCheckbox ? (lightGreen) : Color.secondary)
                            .onTapGesture {
                                regVM.termsAndConditionsCheckbox.toggle()
                            }
                        Text("I Agree to the T&Cs of Grizz Bank Limited")
                            .padding()
                    }
                    
                    HStack{
                        Image(systemName: regVM.PrivacyPolicyCheckbox ? "checkmark.square.fill" : "square")
                            .foregroundColor(regVM.PrivacyPolicyCheckbox ? (lightGreen) : Color.secondary)
                            .onTapGesture {
                                regVM.PrivacyPolicyCheckbox.toggle()
                            }
                        Text("I Agree to the storage and handling of your data in accordance with our Privacy Policy")
                            .padding()
                    }
                    
                    
                }
                
                // add a dead button untill all fields are fill in properly
                // Firebase-Auth*
                //  Button(action: {regVM.createNewUser()},//pass datefunc logic in savebutton func
                Button("SAVE") {
                    regVM.validateUserRegInput()
                }
                .disabled(!regVM.termsAndConditionsCheckbox || !regVM.PrivacyPolicyCheckbox)
                .foregroundColor(.white)
                .font(.headline)
                .frame(height: 50)
                .frame(maxWidth: 300)
                .background(!regVM.termsAndConditionsCheckbox || !regVM.PrivacyPolicyCheckbox ? .gray : lightGreen)
                .cornerRadius(15)
                .padding(2)
                .alert("Oops something went wrong", isPresented: $regVM.presentAlert, actions: {
                    
                    Button("Edit", action: {})
                    
                }, message: {
                    Text("Please make sure all fields are filled in")
                })
                .alert("Successfully registered", isPresented: $regVM.successAlert, actions: {
                    
                    Button("Proceed", action: {regSuccess = true})
                    
                }, message: {
                    Text("Welcome to Grizz Bank Ltd.")
                })
                
                //NavigationLink(destination: UserLoginDetailsView(), label: {Text("test")})
            }
            .navigationBarTitle("Grizz Bank Ltd", displayMode: .inline)
            //.navigationBarHidden(true)
        
    }
        
    
    func saveButtonPressed(){
        //code here
        //window to accept user T&Cs for opening a Bank account then save info to firebase
        //then nav to a window to make a userEmail and password for the account
    }
    
}

struct RegisterNewUserView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterNewUserView()
    }
}

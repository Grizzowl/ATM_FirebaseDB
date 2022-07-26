//
//  UserLoginDetailsView.swift
//  ATM_FirebaseDB
//
//  Created by Grizzowl on 2022/07/26.
//

import SwiftUI
import FirebaseAuth

struct UserLoginDetailsView: View {
    /* Firebase-Auth*
     @StateObject private var regVM = RegistrationViewModelImp(
     service: RegistrationUserImpl()
     )
     */
    //username has to be users email
    @State private var userEmail = ""
    @State private var createPassword = ""
    
    @State private var signUpError = false
    
    @State private var showCreatePasswordField = false
    
    let darkGreen = Color("DarkGreen")
    let lightGreen = Color("LightGreen")
    let gold = Color("Gold")
    
    //Nav to home screen if username and pass are true
    var body: some View {
        
        ZStack{
            VStack{}
            darkGreen
                .ignoresSafeArea()
            Circle()
                .scale(1.7)
                .foregroundColor(.white)
            Circle()
                .scale(1.7)
                .foregroundColor(lightGreen)
            Circle()
                .scale(1.39)
                .foregroundColor(gold)
            Circle()
                .scale(1.37)
                .foregroundColor(.white)
            
            Spacer()
            
            VStack {
                //place holder image for bank logo
                Image("GrizzBank_APP_LOGO")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .padding(5)
                
                Text("Create Your Login Details")
                    .font(.title)
                
                
                Divider()
                
                //Email login
                Text("Enter Your Email")
                    .frame(width: 270, height: 5)
                    .keyboardType(.emailAddress)
                    .padding()
                
                //TextField("Email Address", text: $regVM.newUser.email) Firebase-Auth*
                TextField("Email Address", text: $userEmail)
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
                            //SecureField("Password", text: $regVM.newUser.password) Firebase-Auth*
                            SecureField("Password", text: $createPassword)
                                .padding()
                                .frame(width: 300, height: 50)
                                .background(Color.black.opacity(0.05))
                                .cornerRadius(15)
                                .padding(1)
                            
                        } else {
                            // TextField("Password", text: $regVM.newUser.password) Firebase-Auth*
                            TextField("Password", text: $createPassword)
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
                
                Rectangle()
                    .fill(darkGreen)
                    .frame(width: 350, height: 1, alignment: .center)
                    .padding(.leading, 15.5)
                
                Button("Create Account") {
                    /* Firebase-Auth*
                     regVM.createNewUser()
                     */
                }
                .foregroundColor(.white)
                .frame(width: 300, height: 50)
                .background(Color.black)
                .cornerRadius(15)
                .padding(11)
                
                //error message <here> for userEmail or password
                
                
            }
            Spacer()
        }
        .navigationBarHidden(true)
        /* Firebase-Auth*
         .alert(isPresented: $regVM.hasError,
         content: {
         
         if case .failed(let error) = regVM.state {
         return Alert(
         title: Text("Error"),
         message: Text(error.localizedDescription))
         } else {
         return Alert(
         title: Text("Error"),
         message: Text("Something went wrong"))
         }
         })
         */
    }
    
}

struct UserLoginDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        UserLoginDetailsView()
    }
}

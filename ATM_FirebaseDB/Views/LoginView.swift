//
//  LoginView.swift
//  ATM_FirebaseDB
//
//  Created by Grizzowl on 2022/07/21.
//

import SwiftUI

struct LoginView: View {
    
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showLoginScreen = false
    @State private var wrongUsernameInput = false
    @State private var wrongPasswordInput = false
    @State var isLoggedIn = false
    
    @State private var showPasswordField = false
    
    let darkGreen = Color("DarkGreen")
    let lightGreen = Color("LightGreen")
    let gold = Color("Gold")
    
    //Nav to home screen if username and pass are true
    var body: some View {
        
        ZStack{
            
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
                Text("Grizz Bank Ltd")
                    .font(Font.custom("Snell Roundhand", size: 50))
                    .bold()
                    .padding()
               
                Divider()
                
                //login screen
                Text("Login")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                //user login
                TextField("Username", text: $username)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(15)
                    .padding(1)
                    .border(.red, width: CGFloat(wrongUsername)) //wrong or nill user name
                
                //password login
                HStack{
                    ZStack{
                        if showPasswordField == false {
                            SecureField("Password", text: $password)
                                .padding()
                                .frame(width: 300, height: 50)
                                .background(Color.black.opacity(0.05))
                                .cornerRadius(15)
                                .padding(1)
                                .border(.red, width: CGFloat(wrongPassword)) //wrong or nill user password
                        } else {
                            TextField("Password", text: $password)
                                .padding()
                                .frame(width: 300, height: 50)
                                .background(Color.black.opacity(0.05))
                                .cornerRadius(15)
                                .padding(1)
                                .border(.red, width: CGFloat(wrongPassword))
                        }
                        
                    }
                    
                }.overlay(alignment: .trailing){
                    Image(systemName: showPasswordField ? "eye": "eye.slash")
                        .onTapGesture {
                            showPasswordField.toggle()
                        }
                        .padding()
                }
                
                
                Button("Sign In") {
                    
                    //Auth user code
                    // WIP need set up new user reg view and link firebase
                    
                    
                }
                .foregroundColor(.white)
                .frame(width: 300, height: 50)
                .background(Color.black)
                .cornerRadius(15)
                .padding(11)
                
                //error message <here> for username or password
                
                HStack {
                    Text("Don't Have An Account?")
                    NavigationLink(
                        destination: RegisterNewUserView(),
                        label: {
                            Text("Sign Up")
                                .foregroundColor(.blue)
                        })
                } // HStack close
                
            }
            Spacer()
        }
        .navigationBarHidden(true)
        
        
    }
    
    
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

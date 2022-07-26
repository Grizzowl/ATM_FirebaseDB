//
//  UserLoginDetailsView.swift
//  ATM_FirebaseDB
//
//  Created by Grizzowl on 2022/07/26.
//

import SwiftUI

struct UserLoginDetailsView: View {
    @State private var username = ""
    @State private var createPassword = ""
    
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
                Image(systemName: "banknote")
                    .resizable()
                    .frame(width: 100, height: 50)
                    .padding(50)
                
               
                Divider()
                
                //choose user name login
                Text("Enter Your Username")
                    .frame(width: 270, height: 5)
                    .padding()
                
                TextField("Username", text: $username)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(15)
                    .padding(1)
                    //.border(.red, width: CGFloat(wrongUsername)) //wrong or nill user name

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
                            SecureField("Password", text: $createPassword)
                                .padding()
                                .frame(width: 300, height: 50)
                                .background(Color.black.opacity(0.05))
                                .cornerRadius(15)
                                .padding(1)
                                //.border(.red, width: CGFloat(wrongPassword)) //wrong or nill user password
                        } else {
                            TextField("Password", text: $createPassword)
                                .padding()
                                .frame(width: 300, height: 50)
                                .background(Color.black.opacity(0.05))
                                .cornerRadius(15)
                                .padding(1)
                                //.border(.red, width: CGFloat(wrongPassword))
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
                    
                    //set up users details and save suername and password
                    //check is username exists in the db
                    // WIP need set up new user reg view and link firebase
                    
                    
                }
                .foregroundColor(.white)
                .frame(width: 300, height: 50)
                .background(Color.black)
                .cornerRadius(15)
                .padding(11)
                
                //error message <here> for username or password
                
                
            }
            Spacer()
        }
        .navigationBarHidden(true)
        
        
    }
    
    
    
}

struct UserLoginDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        UserLoginDetailsView()
    }
}
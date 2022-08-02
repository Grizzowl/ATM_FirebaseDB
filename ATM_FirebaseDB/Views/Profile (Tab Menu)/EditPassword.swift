//
//  EditPassword.swift
//  ATM_FirebaseDB
//
//  Created by Grizzowl on 2022/08/02.
//

import SwiftUI

struct EditPassword: View {
    
    @State var confirmCurrentPassword:String = "" //auth password against database
    @State var newPassword:String = ""
    @State var confirmNewPassword:String = ""
    
    @State private var showCurrentPassword = false
    @State private var showNewPassword = false
    @State private var showConfirmNewPassword = false
    
    var lightGreen = Color("LightGreen")
    
    var body: some View {
        
        ZStack{
            Color.clear
                .ignoresSafeArea()
            
            VStack{
                Text("Update Your Password")
                    .foregroundColor(lightGreen)
                    .bold()
                    .frame(width: 400, height: 30, alignment: .leading)
                    .padding(.bottom)
                
                Group{
                    Text("Current Password")
                        .foregroundColor(lightGreen)
                        .foregroundColor(.black.opacity(0.7))
                        .padding(.leading, 10)
                        .frame(width: 400, height: 30, alignment: .leading)
                    
                    HStack{
                        ZStack{
                            if showCurrentPassword == false {
                                SecureField("Current Password", text: $confirmCurrentPassword)
                                    .padding()
                                    .frame(width: 350, height: 50)
                                    .background(Color.black.opacity(0.05))
                                    .cornerRadius(15)
                                    .padding(.trailing, 60)
                                
                                
                            } else {
                                TextField("Current Password", text: $confirmCurrentPassword)
                                    .padding()
                                    .frame(width: 350, height: 50)
                                    .background(Color.black.opacity(0.05))
                                    .cornerRadius(15)
                                    .padding(.trailing, 60)
                                
                                
                            }
                            
                        }
                        
                    }.overlay(alignment: .trailing){
                        Image(systemName: showCurrentPassword ? "eye": "eye.slash")
                            .onTapGesture {
                                showCurrentPassword.toggle()
                            }
                            .padding()
                        
                        
                    }
                    
                    Divider()
                    
                    Group{
                        Text("New Password")
                            .foregroundColor(lightGreen)
                            .foregroundColor(.black.opacity(0.7))
                            .frame(width: 400, height: 30, alignment: .leading)
                            .padding(.leading, 10)
                            .padding(.top, 20)
                        
                        HStack{
                            ZStack{
                                if showNewPassword == false {
                                    SecureField("New Password", text: $newPassword)
                                        .padding()
                                        .frame(width: 350, height: 50)
                                        .background(Color.black.opacity(0.05))
                                        .cornerRadius(15)
                                        .padding(.trailing, 60)
                                    
                                } else {
                                    TextField("New Password", text: $newPassword)
                                        .padding()
                                        .frame(width: 350, height: 50)
                                        .background(Color.black.opacity(0.05))
                                        .cornerRadius(15)
                                        .padding(.trailing, 60)
                                    
                                }
                                
                            }
                            
                        }.overlay(alignment: .trailing){
                            Image(systemName: showNewPassword ? "eye": "eye.slash")
                                .onTapGesture {
                                    showNewPassword.toggle()
                                }
                                .padding()
                        }
                    }
                    
                    Group{
                        Text("Confirm New Password")
                            .foregroundColor(lightGreen)
                            .foregroundColor(.black.opacity(0.7))
                            .frame(width: 400, height: 30, alignment: .leading)
                            .padding(.leading, 10)
                        
                        HStack{
                            ZStack{
                                if showConfirmNewPassword == false {
                                    SecureField("Confirm Password", text: $confirmNewPassword)
                                        .padding()
                                        .frame(width: 350, height: 50)
                                        .background(Color.black.opacity(0.05))
                                        .cornerRadius(15)
                                        .padding(.trailing, 60)
                                    
                                } else {
                                    TextField("Confirm Password", text: $confirmNewPassword)
                                        .padding()
                                        .frame(width: 350, height: 50)
                                        .background(Color.black.opacity(0.05))
                                        .cornerRadius(15)
                                        .padding(.trailing, 60)
                                    
                                }
                                
                            }
                            
                        }.overlay(alignment: .trailing){
                            Image(systemName: showConfirmNewPassword ? "eye": "eye.slash")
                                .onTapGesture {
                                    showConfirmNewPassword.toggle()
                                }
                                .padding()
                        }
                    }
                    VStack{
                        
                        Button(
                            action: saveButtonPressed,
                            label: {Text("Save Changes".uppercased())
                                    .foregroundColor(.white)
                                    .font(.headline)
                                    .frame(height: 50)
                                    .frame(maxWidth: 300)
                                    .background(lightGreen)
                                    .cornerRadius(15)
                                    .padding(10)
                            })
                    }
                    .padding(.top, 50)
                    
                    Spacer()
                }
            }
        }
        
    }
        
    func saveButtonPressed() {
        //code here
        //window to accept user T&Cs for opening a Bank account then save info to firebase
        //then nav to a window to make a username and password for the account
    }
}

struct EditPassword_Previews: PreviewProvider {
    static var previews: some View {
        EditPassword()
    }
}

//
//  UserProfileDetails.swift
//  ATM_FirebaseDB
//
//  Created by Grizzowl on 2022/08/02.
//

import SwiftUI

struct UserProfileDetails: View {
    
    //Account holders name
    @State var accountHoldersName:String = "Mike Hunt"
    //Email Address
    @State var personalEmail:String = "mhunt@gmail.com"
    @State var lastEmail:String = "mhunt@gmail.com"
    @State var editPersonalEmail:Bool = true
    //Login Username
    @State var username:String = "Mike.Hunt"
    @State var lastUsername:String = "Mike.Hunt"
    @State var editUsername:Bool = true
    
    var lightGreen = Color("LightGreen")
    
    var body: some View {
        
        ZStack{
            (Color.clear)
                .ignoresSafeArea()
            
            VStack{
                
                Text("Personal Infomation")
                    .foregroundColor(lightGreen)
                    .bold()
                    .frame(width: 400, height: 30, alignment: .leading)
                    .padding(.bottom)
                
                Group{
                    //Account holders name
                    Text("Name")
                        .foregroundColor(lightGreen)
                        .foregroundColor(.black.opacity(0.7))
                        .frame(width: 400, height: 30, alignment: .leading)
                    
                    TextField("Enter account holder name/s here", text: $accountHoldersName)
                        .disabled(true)
                        .frame(width: 400, height: 35)
                        .font(.title2)
                    
                    Rectangle()
                        .frame(width: 400, height: 1)
                        .foregroundColor(.black.opacity(0.7))
                        .padding(.bottom, 30)
                }
                
                Group{
                    //Email Address
                    Text("Email Address")
                        .foregroundColor(lightGreen)
                        .foregroundColor(.black.opacity(0.7))
                        .frame(width: 400, height: 30, alignment: .leading)
                    
                    HStack {
                        TextField("\(lastEmail)", text: $personalEmail)
                            .disabled(editPersonalEmail)
                            .frame(width: 400, height: 40)
                            .background(editPersonalEmail ?  .clear : Color.black.opacity(0.1))
                            .font(.title2)
                    }
                     .overlay(alignment: .trailing){
                         Image(systemName: "square.and.pencil")
                             .resizable()
                             .frame(width: 25, height: 25)
                             .foregroundColor(lightGreen)
                             .onTapGesture {
                                editPersonalEmail.toggle()
                             }
                             .padding()
                     }
                    
                    
                    Rectangle()
                        .frame(width: 400, height: 1)
                        .foregroundColor(.black.opacity(0.7))
                        .padding(.bottom, 30)
                }
                
                Group{
                    //Login Username
                    Text("Username")
                        .foregroundColor(lightGreen)
                        .foregroundColor(.black.opacity(0.7))
                        .frame(width: 400, height: 30, alignment: .leading)
                    
                    HStack {
                        TextField("\(lastUsername)", text: $username)
                            .disabled(editUsername)
                            .frame(width: 400, height: 40)
                            .background(editUsername ?  .clear : Color.black.opacity(0.1))
                            .font(.title2)
                    }
                    .overlay(alignment: .trailing){
                        Image(systemName: "square.and.pencil")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(lightGreen)
                            .onTapGesture {
                                editUsername.toggle()
                            }
                            .padding()
                    }
                    
                    Rectangle()
                        .frame(width: 400, height: 1)
                        .foregroundColor(.black.opacity(0.7))
                        .padding(.bottom, 30)
                }
                
                Group{
                    //login Password
                    Text("Password")
                        .foregroundColor(lightGreen)
                        .foregroundColor(.black.opacity(0.7))
                        .frame(width: 400, height: 30, alignment: .leading)
                    
                    NavigationLink(
                    destination: EditPassword(),
                    label: {
                        HStack{
                            
                            Text("********")
                                .foregroundColor(.black)
                                .frame(width: 380, height: 30, alignment: .leading)
                                .padding(.leading, 75)
                            
                            Image(systemName: "chevron.right")
                                .resizable()
                                .frame(width: 10, height: 17)
                                .padding(.trailing, 75)
                        }
                        .padding(.bottom)
                        .padding(.top)
                    })
                    
                    Rectangle()
                        .frame(width: 400, height: 1)
                        .foregroundColor(.black.opacity(0.7))
                        .padding(.bottom, 30)
                }
                
                //test button
                if (lastUsername != username || lastEmail != personalEmail) {
                    Button(
                        action: saveButtonPressed,
                        label: {Text("Save Changes".uppercased())
                                .foregroundColor(.white)
                                .font(.headline)
                                .frame(height: 50)
                                .frame(maxWidth: 300)
                                .background(lightGreen)
                                .cornerRadius(15)
                                .padding(1.5)
                        })
                }
                
                
                Spacer()
            }
            .frame(width: 400, height: 700)
            .padding()
            .background(Color.white)
            .cornerRadius(15)
            .shadow(color: .black.opacity(0.25), radius: 5, x: 3, y: -5)
                .navigationViewStyle(.stack)
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
        }
        
    }
    
    func saveButtonPressed() {
       //code here
        //window to accept user T&Cs for opening a Bank account then save info to firebase
        //then nav to a window to make a username and password for the account
    }
}


struct UserProfileDetails_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileDetails()
    }
}
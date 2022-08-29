//
//  UserProfileDetails.swift
//  ATM_FirebaseDB
//
//  Created by Grizzowl on 2022/08/02.
//

import SwiftUI

struct UserProfileDetails: View {
    /* Firebase-Auth*
    @EnvironmentObject var uSImp: UserSessionImp
    */
    //Account holders name
    @State var accountHoldersName:String = "Mike Hunt"
    //Email Address
    @State var personalEmail:String = "mhunt@gmail.com"
    @State var lastEmail:String = "mhunt@gmail.com"
    @State var editPersonalEmail:Bool = true
    //Login Username username is email
    @State var username:String = "mhunt@gmail.com"
    @State var lastUsername:String = "mhunt@gmail.com"
    @State var editUsername:Bool = true
    
    var lightGreen = Color("LightGreen")
    
    var body: some View {
        
        ZStack{
            (Color.clear)
                .ignoresSafeArea()
            
            VStack{
                
                HStack{
                    Text("Personal Infomation")
                        .foregroundColor(lightGreen)
                        .bold()
                        .frame(width: 320, height: 30, alignment: .leading)
                        .padding(.bottom)
                    
                    Button {
                        Task{
                           // uSImp.logout() Firebase-Auth*
                        }
                    } label: {
                        Text("Sign Out")
                            .foregroundColor(.white)
                            .bold()
                            .frame(width: 90, height: 30, alignment: .center)
                            .background(lightGreen)
                            .cornerRadius(15)
                            .padding(.bottom)
                    }
                }
                
                
                
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
                    //login Password
                    Text("Password")
                        .foregroundColor(lightGreen)
                        .foregroundColor(.black.opacity(0.7))
                        .frame(width: 400, height: 30, alignment: .leading)
                    
                    NavigationLink(
                        destination: /* ForgotPasswordView() Firebase-Auth* */
                        {/* Edit Password Link Here */},
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
                if (lastEmail != personalEmail) {
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
        //then nav to a window to make a userEmail and password for the account
    }
}


struct UserProfileDetails_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileDetails()
            // .environmentObject(UserSessionImp()) Firebase-Auth*
    }
}

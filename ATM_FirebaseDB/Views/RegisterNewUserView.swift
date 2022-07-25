//
//  RegisterNewUserView.swift
//  ATM_FirebaseDB
//
//  Created by Grizzowl on 2022/07/21.
//

import SwiftUI

struct RegisterNewUserView: View {
    
    @State var nameTextFieldText: String = ""
    @State var surnameTextFieldText: String = ""
    @State var idTextFieldText: String = ""
    @State var telephoneTextFieldText: String = ""
    @State var emailTextFieldText: String = ""
    @State private var date = Date()
    
    
    let lightGreen = Color("LightGreen")
    
    var body: some View {
        
        VStack {
            Text("Express Registration")
                .font(.title)
            
            List {
                VStack {
                    Text("Name")
                    TextField("Name", text: $nameTextFieldText)
                }
                .padding()
                VStack {
                    Text("Surname")
                    TextField("Surname", text: $surnameTextFieldText)
                }
                .padding()
                VStack {
                    Text("ID") //look up regex make sure its a valid SA id format
                    TextField("Your ID number", text: $idTextFieldText)
                }
                .padding()
                // add phone and email when there is a bot set up to send otp information to user
                VStack {
                    Text("Telephone")
                    HStack {
                        Text("+27")
                        Spacer()
                        TextField("xx-xxx-xxxx", text: $telephoneTextFieldText)
                   }
                }
                .padding()
                VStack {
                    Text("Email") //email validation needed
                    TextField("xxxx@email.com", text: $emailTextFieldText)
                }
                .padding()
                VStack {
                    Text("Date of Birth") //add logic to stop user from adding a birthday thats younger than 18 or before current day
                    HStack {
                        //
                        DatePicker(
                            "\(date, style: .date)",
                                selection: $date,
                                displayedComponents: [.date]
                            )
                    }
                    
                }
                .padding()
                
               
            }
            Button(action: saveButtonPressed, label: {
                Text("Save".uppercased())
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(height: 50)
                    .frame(maxWidth: 300)
                    .background(lightGreen)
                    .cornerRadius(15)
                    .padding(1.5)
            })
            
        }
        //.navigationBarHidden(true)
        .navigationBarTitle("Grizz Bank Ltd", displayMode: .inline)
        
        
        
        
    }
    
    func saveButtonPressed() {
       //code here
        //window to accept user T&Cs for opening a Bank account then save info to firebase
        //then nav to a window to make a username and password for the account
    }
    
}

struct RegisterNewUserView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterNewUserView()
    }
}

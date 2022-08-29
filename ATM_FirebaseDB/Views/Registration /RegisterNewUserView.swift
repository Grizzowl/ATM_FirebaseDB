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
    @State var nameTextFieldText: String = ""
    @State var surnameTextFieldText: String = ""
    @State var idTextFieldText: String = ""
    @State var telephoneTextFieldText: String = ""
    @State var emailTextFieldText: String = ""
    
    @State private var dateOfBirth = Date()
    @State private var getdateOfBirth = ""
    var formattedDate: DateFormatter {
        let formattedDateOfBirth = DateFormatter()
        formattedDateOfBirth.dateStyle = .long
        return formattedDateOfBirth
    }
    
    @State private var termsAndConditionsCheckbox = false
    @State private var PrivacyPolicyCheckbox = false
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
                        Text("Name")
                        //TextField("Name", text: $regVM.newUser.name) Firebase-Auth*
                        TextField("Name", text: $nameTextFieldText)
                    }
                    .padding()
                    
                    
                    VStack {
                        Text("Surname")
                        //TextField("Surname", text: $regVM.newUser.surname) Firebase-Auth*
                        TextField("Surname", text: $surnameTextFieldText)
                    }
                    .padding()
                    
                    
                    VStack {
                        Text("ID") //look up regex make sure its a valid SA id format
                        //TextField("Your ID number", text: $regVM.newUser.userIDNumber) Firebase-Auth*
                        TextField("Your ID number", text: $idTextFieldText)
                    }
                    .padding()
                    
                    // add phone and email when there is a bot set up to send otp information to user
                    
                    VStack {
                        Text("Telephone")
                        HStack {
                            Text("+27")
                            Spacer()
                            //TextField("xx-xxx-xxxx", text: $regVM.newUser.telephone) Firebase-Auth*
                            TextField("xx-xxx-xxxx", text: $telephoneTextFieldText)
                        }
                    }
                    .padding()
                    
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
                // add a navlink to a PDF of the privacy policy and T&Cs +make both checkboxes mandatory
                HStack{
                    Image(systemName: termsAndConditionsCheckbox ? "checkmark.square.fill" : "square")
                        .foregroundColor(termsAndConditionsCheckbox ? (lightGreen) : Color.secondary)
                        .onTapGesture {
                            self.termsAndConditionsCheckbox.toggle()
                        }
                    Text("I Agree to the T&Cs of Grizz Bank Limited")
                        .padding(0.5)
                }
                
                HStack{
                    Image(systemName: PrivacyPolicyCheckbox ? "checkmark.square.fill" : "square")
                        .foregroundColor(PrivacyPolicyCheckbox ? (lightGreen) : Color.secondary)
                        .onTapGesture {
                            self.PrivacyPolicyCheckbox.toggle()
                        }
                    Text("I Agree to the storage and handling of your data in accordance with our Privacy Policy")
                        .padding()
                }
                
                
            }
            
            // add a dead button untill all fields are fill in properly
            // Firebase-Auth*
            //  Button(action: {regVM.createNewUser()},//pass datefunc logic in savebutton func
            Button(action: {},
                   label: {
                Text("Save".uppercased())
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(height: 50)
                    .frame(maxWidth: 300)
                    .background(lightGreen)
                    .cornerRadius(15)
                    .padding(1.5)
            })
            NavigationLink(destination: UserLoginDetailsView(), label: {Text("test")})
        }
        //.navigationBarHidden(true)
        .navigationBarTitle("Grizz Bank Ltd", displayMode: .inline)
        
        
        
        
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

//
//  CardInformationView.swift
//  ATM_FirebaseDB
//
//  Created by Grizzowl on 2022/07/29.
//

import SwiftUI

struct CardInformation: View {
    
    @State var cardNumber:String = "0000 0000 0000 0000"
    @State var expDate:String = "02/23"
    @State var cvvNumber:String = "000"
    
    let lightGreen = Color("LightGreen")
    
    @State private var showExpDateField = false
    @State private var showCvvField = false
    
    var body: some View {
        NavigationView {
            ZStack{
                lightGreen
                    .frame(height: 450)
                
                VStack {
                    Text("Card Number")
                        .bold()
                    TextField("Card Number", text: $cardNumber)
                        .padding()
                        .frame(height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(15)
                        .padding(1)
                    
                    Text("Expiration Date")
                        .bold()
                    HStack{
                        ZStack{
                            if showExpDateField == false {
                                SecureField("Password", text: $expDate)
                                    .padding()
                                    .frame(height: 50)
                                    .background(Color.black.opacity(0.05))
                                    .cornerRadius(15)
                                    .padding(1)
                            } else {
                                TextField("Password", text: $expDate)
                                    .padding()
                                    .frame(height: 50)
                                    .background(Color.black.opacity(0.05))
                                    .cornerRadius(15)
                                    .padding(1)
                            }
                            
                        }
                    
                    }.overlay(alignment: .trailing){
                        Image(systemName: showExpDateField ? "eye": "eye.slash")
                            .onTapGesture {
                                showExpDateField.toggle()
                            }
                            .padding()
                    }
                    
                    Text("Expiration Date")
                        .bold()
                    HStack{
                        ZStack{
                            if showCvvField == false {
                                SecureField("Password", text: $cvvNumber)
                                    .padding()
                                    .frame(height: 50)
                                    .background(Color.black.opacity(0.05))
                                    .cornerRadius(15)
                                    .padding(1)
                            } else {
                                TextField("Password", text: $cvvNumber)
                                    .padding()
                                    .frame(height: 50)
                                    .background(Color.black.opacity(0.05))
                                    .cornerRadius(15)
                                    .padding(1)
                            }
                            
                        }
                        
                    }.overlay(alignment: .trailing){
                        Image(systemName: showCvvField ? "eye": "eye.slash")
                            .onTapGesture {
                                showCvvField.toggle()
                            }
                            .padding()
                    }
                    
                    NavigationLink(
                    destination: HelpDesk(),
                    label: {
                        HStack{
                            Image(systemName: "creditcard.trianglebadge.exclamationmark")
                                .resizable()
                                .frame(width: 40, height: 25)
                            Text("Lost Card")
                                .frame(alignment: .leading)
                                .foregroundColor(.black)
                                .font(.headline)
                                .cornerRadius(15)
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .resizable()
                                .frame(width: 10, height: 17)
                        }
                        .padding(.bottom)
                        .padding(.top)
                        
                    })
                        
                        NavigationLink(
                        destination: HelpDesk(),
                        label: {
                            HStack{
                                Image(systemName: "rectangle.badge.plus")
                                    .resizable()
                                    .frame(width: 40, height: 25)
                                Text("Request New Card")
                                    .frame(alignment: .leading)
                                    .foregroundColor(.black)
                                    .font(.headline)
                                    .cornerRadius(15)
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .resizable()
                                    .frame(width: 10, height: 17)
                            }
                            .padding(.bottom)
                            .padding(.top)
                        
                    })
                    
                }
                .padding()
                .background(Color.white)
                .cornerRadius(15)
                .shadow(color: .black.opacity(0.25), radius: 5, x: 3, y: -5)
                    .navigationViewStyle(.stack)
                    .navigationBarBackButtonHidden(true)
                    .navigationBarHidden(true)
            }
            
        }
        
    }
}

struct CardInformationView_Previews: PreviewProvider {
    static var previews: some View {
        CardInformation()
    }
}

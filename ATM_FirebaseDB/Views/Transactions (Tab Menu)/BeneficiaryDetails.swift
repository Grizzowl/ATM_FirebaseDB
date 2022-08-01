//
//  BeneficiaryDetails.swift
//  ATM_FirebaseDB
//
//  Created by Grizzowl on 2022/08/01.
//

import SwiftUI

struct BeneficiaryDetails: View {
    
    var lightGreen = Color("LightGreen")
    
    @State var accountHoldersName:String = ""
    @State var accountHoldersBank:String = "Grizz Bank Ltd"
    @State var accountHoldersAccountNumber:String = ""
    @State var paymentReference:String = ""
    @State var paymentAmount:String = ""
    
    var body: some View {
        
        ZStack{
            (Color.white)
                .ignoresSafeArea()
            
            VStack{
                
                Text("Account Details")
                    .foregroundColor(lightGreen)
                    .bold()
                    .frame(width: 400, height: 30, alignment: .leading)
                    .padding(.bottom)
                
                Group{
                    //Account holders name
                    Text("Account Holders Name")
                        .foregroundColor(.black.opacity(0.7))
                        .frame(width: 400, height: 30, alignment: .leading)
                    
                    TextField("Enter account holder name/s here", text: $accountHoldersName)
                        .frame(width: 400, height: 50)
                    
                    Rectangle()
                        .frame(width: 400, height: 1)
                        .foregroundColor(.black.opacity(0.7))
                        .padding(.bottom, 30)
                }
                
                Group{
                    //Choose Bank
                    Text("Bank")
                        .foregroundColor(.black.opacity(0.7))
                        .frame(width: 400, height: 30, alignment: .leading)
                    
                    TextField("Enter account holders bank", text: $accountHoldersBank)
                        .disabled(true)
                        .frame(width: 400, height: 50)
                    
                    Rectangle()
                        .frame(width: 400, height: 1)
                        .foregroundColor(.black.opacity(0.7))
                        .padding(.bottom, 30)
                }
                
                Group{
                    //Account Number
                    Text("Account Number")
                        .foregroundColor(.black.opacity(0.7))
                        .frame(width: 400, height: 30, alignment: .leading)
                    
                    TextField("Enter account number of beneficiary", text: $accountHoldersAccountNumber)
                        .frame(width: 400, height: 50)
                    
                    Rectangle()
                        .frame(width: 400, height: 1)
                        .foregroundColor(.black.opacity(0.7))
                        .padding(.bottom, 30)
                }
                
                Group{
                    //Payment Reference
                    Text("Payment Reference")
                        .foregroundColor(.black.opacity(0.7))
                        .frame(width: 400, height: 30, alignment: .leading)
                    
                    TextField("Enter payment reference here", text: $paymentReference)
                        .frame(width: 400, height: 50)
                    
                    Rectangle()
                        .frame(width: 400, height: 1)
                        .foregroundColor(.black.opacity(0.7))
                        .padding(.bottom, 30)
                }
                
                Group{
                    //Payment Amount
                    Text("Payment Amount")
                        .foregroundColor(.black.opacity(0.7))
                        .frame(width: 400, height: 30, alignment: .center)
                    
                    HStack{
                        Text("R")
                            .font(.largeTitle)
                            .frame(width: 30, height: 30, alignment: .leading)
                        
                        TextField("0.00", text: $paymentAmount)
                            .font(.largeTitle)
                            .frame(width: 350, height: 50, alignment: .center)
                    }
                    Rectangle()
                        .frame(width: 400, height: 1)
                        .foregroundColor(.black.opacity(0.7))
                        .padding(.bottom, 30)
                }
                //test button
                NavigationLink(
                    destination: PaymentConfirmation(),
                    label: {Text("confirm payment".uppercased())
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 50)
                            .frame(maxWidth: 300)
                            .background(lightGreen)
                            .cornerRadius(15)
                            .padding(1.5)
                    })
                
                Spacer()
            }
        }
    }
}

struct BeneficiaryDetails_Previews: PreviewProvider {
    static var previews: some View {
        BeneficiaryDetails()
    }
}

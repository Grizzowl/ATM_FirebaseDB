//
//  PaymentConfirmation.swift
//  ATM_FirebaseDB
//
//  Created by Grizzowl on 2022/08/01.
//

import SwiftUI

struct PaymentConfirmation: View {
    //link BeneficiaryDetails Input to be displayed here
    @State var testHoldersName:String = "Chris Peacock"
    @State var testHoldersBank:String = "Grizz Bank Ltd"
    @State var testHoldersAccountNumber:String = "415 151 5469"
    @State var testReference:String = "Rent"
    @State var testAmount:String = "420.30"
    @State var testAccountNumber:String = "415 151 6912"
    @State var testAccountType:String = "Premium Account"
    
    
    var lightGreen = Color("LightGreen")
    
    var body: some View {
        VStack{
            Group{
                Image(systemName: "person.circle")
                    .resizable()
                    .foregroundColor(lightGreen)
                    .frame(width: 100, height: 100)
                    .padding(30)
                
                Text("\(testHoldersName)")
                    .font(.title)
                    .bold()
                    .padding(.bottom, 10)
                
                Text("\(testHoldersBank)")
                
                Text("\(testHoldersAccountNumber)")
                    .font(.title2)
            }
            
            Rectangle()
                .frame(width: 400, height: 1)
                .foregroundColor(.black.opacity(0.7))
                .padding(.bottom, 30)
            
            Group{
                VStack{
                    HStack{
                        Text("Payment Reference")
                            .foregroundColor(.black.opacity(0.7))
                            .frame(width: 150, height: 20, alignment: .leading)
                            .padding(.trailing, 30)
                        Text("\(testReference)")
                            .frame(width: 180, height: 20, alignment: .leading)
                        
                    }
                    HStack{
                        Text("Payment Amount")
                            .foregroundColor(.black.opacity(0.7))
                            .frame(width: 150, height: 20, alignment: .leading)
                            .padding(.trailing, 30)
                        Text("R \(testAmount)")
                            .frame(width: 180, height: 20, alignment: .leading)
                    }
                }
                .padding(.bottom, 20)
            }
            
            
            Group{
                VStack{
                    Text("From:")
                        
                        .frame(width: 370, height: 20, alignment: .leading)
                    
                    HStack{
                        Text("Account Number")
                            .foregroundColor(.black.opacity(0.7))
                            .frame(width: 150, height: 20, alignment: .leading)
                            .padding(.trailing, 30)
                        Text("\(testAccountNumber)")
                            .frame(width: 180, height: 20, alignment: .leading)
                        
                    }
                    HStack{
                        Text("Account Type")
                            .foregroundColor(.black.opacity(0.7))
                            .frame(width: 150, height: 20, alignment: .leading)
                            .padding(.trailing, 30)
                        Text("\(testAccountType)")
                            .frame(width: 180, height: 20, alignment: .leading)
                    }
                }
                .padding(.bottom, 20)
            }
            
            Spacer()
        }
    }
}

struct PaymentConfirmation_Previews: PreviewProvider {
    static var previews: some View {
        PaymentConfirmation()
    }
}

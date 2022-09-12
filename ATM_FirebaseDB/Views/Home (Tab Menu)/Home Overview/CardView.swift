//
//  CardView.swift
//  ATM_FirebaseDB
//
//  Created by Grizzowl on 2022/07/27.
//

import SwiftUI

struct CardView: View {
    
    @EnvironmentObject var service: UserSessionImp
    
    let darkGreen = Color("DarkGreen")
    let lightGreen = Color("LightGreen")
    let gold = Color("Gold")
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                
                VStack{
                    Text("Premium Account")
                        .foregroundColor(.white)
                    Text("Acc no. \(service.userDetails?.accountNumber ?? "N/A")")
                        .foregroundColor(.white)
                        .font(.caption)
                }
                
                Spacer()
                Image("visaLogo") // logo
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 35, height: 15)
                    .foregroundColor(.white)
                    .padding()
            }
            Spacer()
            Text("Balance")
                .foregroundColor(.white)
                .font(.caption)
                .padding(.bottom, 5)
            HStack(alignment: .center) {
                Text("ZAR")
                    .foregroundColor(.white)
                    .font(.caption)
                Text("\(service.userCardDetails?.balance ?? 0)")            // link firebase current amount
                    .foregroundColor(.white)
                    .font(.headline)
                    .fontWeight(.heavy)
            }
            .padding(.bottom)
            Spacer()
            HStack {
                Text("\(service.userDetails?.name ?? "N/A") \(service.userDetails?.surname ?? "N/A")")
                    .foregroundColor(.white)
                    .font(.caption)
                    .bold()
                    .padding(.bottom)
                Spacer()
                Text("EXP Date")
                    .foregroundColor(.white)
                    .font(.caption)
                    .bold()
                    .padding(.bottom)
                Text("\(service.userCardDetails?.expDate ?? "N/A")")                   //get from firebase (+5years from account creation)
                    .foregroundColor(.white)
                    .font(.caption)
                    .padding(.bottom)
            }
            
        }
        .frame(width: 300, height: 150)
        .padding(8)
        .background(
            LinearGradient(
                gradient: Gradient(
                    colors: [lightGreen, darkGreen]),
                startPoint: .leading,
                endPoint: .bottomTrailing
            ))
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 5, y: 5)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
            .environmentObject(UserSessionImp())
    }
}

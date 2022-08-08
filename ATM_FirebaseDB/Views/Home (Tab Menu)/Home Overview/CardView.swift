//
//  CardView.swift
//  ATM_FirebaseDB
//
//  Created by Grizzowl on 2022/07/27.
//

import SwiftUI

struct CardView: View {
    
    @ObservedObject var uvm = UserViewModel()
    
    let darkGreen = Color("DarkGreen")
    let lightGreen = Color("LightGreen")
    let gold = Color("Gold")
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                
                VStack{
                    Text("Premium Account")
                        .foregroundColor(.white)
                    Text("4012 8888 8888 1881")         //card nummber backend generated
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
                Text("R 1 ,200 ,000.00")            // link firebase current amount
                    .foregroundColor(.white)
                    .font(.headline)
                    .fontWeight(.heavy)
            }
            .padding(.bottom)
            Spacer()
            HStack {
                Text("M Hunt")                  // initial first name and full last name
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
                Text("01/29")                   //get from firebase (+5years from account creation)
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
    }
}

//
//  UserCardDetailsHeader.swift
//  ATM_FirebaseDB
//
//  Created by Grizzowl on 2022/07/28.
//

import SwiftUI

struct UserCardDetailsHeader: View {
    
    let darkGreen = Color("DarkGreen")
    let lightGreen = Color("LightGreen")
    let gold = Color("Gold")
    
    var body: some View {
        HStack{
            Text("Card Details")  // 90 day history, user can request more at the bank
                .font(.headline)
            Spacer()
            
        }
        .padding(20)
        .padding(.bottom, 600)
        .foregroundColor(.white)
        .background(lightGreen)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
    }
}

struct UserCardDetailsHeader_Previews: PreviewProvider {
    static var previews: some View {
        UserCardDetailsHeader()
    }
}

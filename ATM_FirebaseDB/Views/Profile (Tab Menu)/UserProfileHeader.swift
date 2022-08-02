//
//  UserProfileHeader.swift
//  ATM_FirebaseDB
//
//  Created by Grizzowl on 2022/08/02.
//

import SwiftUI

struct UserProfileHeader: View {
    
    let darkGreen = Color("DarkGreen")
    let lightGreen = Color("LightGreen")
    let gold = Color("Gold")
    
    var body: some View {
        HStack{
            Text("Profile")  // 90 day history, user can request more at the bank
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

struct UserProfileHeader_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileHeader()
    }
}

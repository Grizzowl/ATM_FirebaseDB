//
//  TransactionsHeader.swift
//  ATM_FirebaseDB
//
//  Created by Grizzowl on 2022/07/27.
//

import SwiftUI

struct TransactionsHeader: View {
    
    let darkGreen = Color("DarkGreen")
    let lightGreen = Color("LightGreen")
    let gold = Color("Gold")
    
    var body: some View {
        HStack{
            Text("Transaction History")  // 90 day history, user can request more at the bank
                .font(.headline)
            Spacer()
            Text("Last 90 days")
                .font(.caption)
        }
        .padding(20)
        .padding(.bottom, 30)
        .foregroundColor(.white)
        .background(lightGreen)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
    }
}

struct TransactionsHeader_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsHeader()
    }
}

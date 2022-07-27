//
//  TransactionHistoryRow.swift
//  ATM_FirebaseDB
//
//  Created by Grizzowl on 2022/07/27.
//

import SwiftUI

struct TransactionHistoryRow: View {
    
    @State var isExpense: Bool = false //the icon should show if a transaction was a payment(red) or income(green)
    
    var body: some View {
        HStack {
            Image(systemName: isExpense ? "square.and.arrow.down": "square.and.arrow.up")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .foregroundColor(isExpense ? Color.green: Color.red)
                .padding(5)
            VStack(alignment: .leading) {
                Text("Youtube Pro")         //get transaction name from DB log
                    .font(.headline)
                Text("20 Apr 2022")      //transactions details
                    .font(.caption)
                    .foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            Text("-R120.0")         //transaction amount
                .font(.headline)
        }
        .padding(8)
    }
}


struct TransactionHistoryRow_Previews: PreviewProvider {
    static var previews: some View {
        TransactionHistoryRow()
    }
}

//
//  HomeScreenOverview.swift
//  ATM_FirebaseDB
//
//  Created by Grizzowl on 2022/07/27.
//

import SwiftUI

struct HomeScreenOverview: View {
    var body: some View {
        VStack(spacing: -40){
            TransactionsHeader()
            LazyVStack {
                ForEach(0..<10, id: \.self) { item in
                    TransactionHistoryRow()
                }
            }
            .background(Color.white)
            .cornerRadius(15)
            .shadow(color: .black.opacity(0.25), radius: 5, x: 3, y: -5)
        }
    }
}

struct HomeScreenOverview_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenOverview()
    }
}

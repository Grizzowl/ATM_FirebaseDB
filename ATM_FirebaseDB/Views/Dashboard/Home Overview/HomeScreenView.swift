//
//  HomeScreenView.swift
//  ATM_FirebaseDB
//
//  Created by Grizzowl on 2022/07/27.
//

import SwiftUI

struct HomeScreenView: View {
    
    let backgroundGreen = Color("BackgroundGreen")
    
    var body: some View {
        
        NavigationView {
            ZStack {
                Color(.white)
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    CardView()
                        .padding()
                    VStack(spacing: -610){
                        TransactionsHeader()
                        ScrollView(.vertical) {
                            TransactionOverview()
                        }
                    }
                }
                .navigationTitle(Text("My Account"))
            }
        }
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}

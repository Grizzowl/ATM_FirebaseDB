//
//  HomePageControllerView.swift
//  ATM_FirebaseDB
//
//  Created by Grizzowl on 2022/07/26.
//

import SwiftUI

/*
 app home page HomePageControllerView
 */

struct HomePageControllerView: View {
    var body: some View {
        TabView {
            HomeScreenView()
                .tabItem { Label("Home", systemImage: "house") }
            CardDetailsView()
                .tabItem { Label("Card", systemImage: "creditcard") }
            TransactionView()
                .tabItem { Label("Transact", systemImage: "banknote") }
            UserProfileView()
                .tabItem { Label("Profile", systemImage: "person") }
        }
    }
}

struct HomePageControllerView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageControllerView()
    }
}

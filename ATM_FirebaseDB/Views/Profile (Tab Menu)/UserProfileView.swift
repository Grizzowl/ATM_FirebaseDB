//
//  UserProfileView.swift
//  ATM_FirebaseDB
//
//  Created by Grizzowl on 2022/08/02.
//

import SwiftUI

struct UserProfileView: View {
    
    var body: some View {
        
        NavigationView {
            ZStack {
                Color(.white)
                    .edgesIgnoringSafeArea(.all)
                
                    VStack(spacing: -610){
                        UserProfileHeader()
                        VStack {
                            UserProfileDetails()
                        }
                    
                }
                
            }
            .navigationViewStyle(.stack)
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}

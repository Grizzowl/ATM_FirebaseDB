//
//  CardDetailsView.swift
//  ATM_FirebaseDB
//
//  Created by Grizzowl on 2022/07/28.
//

import SwiftUI

struct CardDetailsView: View {
    
    var body: some View {
        
        NavigationView {
            ZStack {
                Color(.white)
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    CardTemplate()
                        .padding()
                    VStack(spacing: -610){
                        UserCardDetailsHeader()
                        VStack {
                            CardInformation()
                        }
                    }
                }
                .navigationTitle(Text("My Card"))
            }
        }
    }
}

struct CardDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CardDetailsView()
    }
}

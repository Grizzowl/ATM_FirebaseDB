//
//  TransactionView.swift
//  ATM_FirebaseDB
//
//  Created by Grizzowl on 2022/08/01.
//

import SwiftUI

struct TransactionView: View {
    
    var body: some View {
        
        NavigationView {
            ZStack {
                
                Color(.white)
                    .edgesIgnoringSafeArea(.all)

                    VStack(spacing: -610){

                            BeneficiaryDetails()
                        
                    }
                
                .navigationBarHidden(true)
            }
            
        }
    }
}

struct TransactionView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionView()
    }
}

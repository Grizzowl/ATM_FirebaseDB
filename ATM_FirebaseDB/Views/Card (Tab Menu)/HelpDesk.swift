//
//  HelpDeskView.swift
//  ATM_FirebaseDB
//
//  Created by Grizzowl on 2022/07/28.
//

import SwiftUI

struct HelpDesk: View {
    var body: some View {
        List {
            Text("Customer Service landline")
            HStack{
                Image(systemName: "phone.and.waveform")
                    .padding(.trailing, 25)
                Text("011 555 5656")
                    .foregroundColor(.blue)
            }
            
            Text("Customer Service Email")
            HStack{
                Image(systemName: "envelope")
                    .padding(.trailing, 25)
                Text("helpdesk@grizzbankltd.co.za")
                    .foregroundColor(.blue)
            }
        }
    }
}

struct HelpDeskView_Previews: PreviewProvider {
    static var previews: some View {
        HelpDesk()
    }
}

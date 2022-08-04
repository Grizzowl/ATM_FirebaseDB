//
//  CardTemplateView.swift
//  ATM_FirebaseDB
//
//  Created by Grizzowl on 2022/07/28.
//

import SwiftUI

struct CardTemplate: View {
    
    let darkGreen = Color("DarkGreen")
    let lightGreen = Color("LightGreen")
    let gold = Color("Gold")
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                
                VStack{
                    Text("Premium Account")
                        .foregroundColor(.white)
                    Spacer()
                    HStack{
                        Image("SIMChip") // logo
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 35, height: 15)
                            .foregroundColor(.white)
                            .padding(.bottom, 75)
                            .padding(.leading, 30)
                        
                        Image(systemName: "wifi") // logo
                            .resizable()
                            .foregroundColor(.black.opacity(0.9))
                            .rotationEffect(.degrees(90))
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 25, height: 10)
                            .foregroundColor(.white)
                            .padding(.bottom, 75)
                            .padding(.trailing, 50)
                    }
                    
                }
                
                Spacer()
                
                VStack{
                    ZStack{
                        Image("GrizzBank_APP_LOGO") // Banklogo
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 50, height: 50)
                            .padding(.top)
                        
                        Text("Grizz Bank Ltd")
                            .font(.subheadline)
                            .foregroundColor(.black)
                            .padding(.top)
                    }
                    
                    
                    Spacer()
                    
                        Image("visaHolo") // logo
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 45, height: 15)
                            .foregroundColor(.white)
                            .padding()
                            .padding(.bottom, 12)
                       
                    Image("visaLogo") // logo
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 35, height: 15)
                        .foregroundColor(.white)
                        .padding(.bottom, 15)
                }
            }
            Spacer()
            
        }
        .frame(width: 300, height: 150)
        .padding(8)
        .background(
            LinearGradient(
                gradient: Gradient(
                    colors: [lightGreen, darkGreen]),
                startPoint: .leading,
                endPoint: .bottomTrailing
            ))
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 5, y: 5)
    }
}

struct CardTemplateView_Previews: PreviewProvider {
    static var previews: some View {
        CardTemplate()
    }
}

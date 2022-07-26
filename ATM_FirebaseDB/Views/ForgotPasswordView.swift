//
//  ForgotPasswordView.swift
//  ATM_FirebaseDB
//
//  Created by Grizzowl on 2022/08/11.
//
/* Firebase-Auth*
import SwiftUI

struct ForgotPasswordView: View {
    
    @StateObject private var rpvmImp = ResetPasswordViewModelImp(
        service: ResetPasswordServiceImp()
    )
    
    @State var confirmEmail:String = ""
    
    var lightGreen = Color("LightGreen")
    
    var body: some View {
        
        ZStack{
            Color.clear
                .ignoresSafeArea()
            
            VStack{
                Text("Change Your Password")
                    .foregroundColor(lightGreen)
                    .bold()
                    .frame(width: 400, height: 30, alignment: .leading)
                    .padding(.bottom)
                
                Group{
                    Text("Enter Your Email")
                        .foregroundColor(lightGreen)
                        .foregroundColor(.black.opacity(0.7))
                        .padding(.leading, 10)
                        .frame(width: 400, height: 30, alignment: .leading)
                    
                    
                    TextField("Current Email", text: $rpvmImp.email)
                        .padding()
                        .frame(width: 350, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(15)
                        .padding(.trailing, 60)
                    
                }
                
                Divider()
                
                Group{
                    Text("A link will be sent to your email that will allow you to reset your password*")
                        .foregroundColor(.red)
                    
                }
                
                Spacer()
                
                VStack{
                    
                    Button(
                        action: rpvmImp.sendPasswordResetRequest,
                        label: {Text("Submit".uppercased())
                                .foregroundColor(.white)
                                .font(.headline)
                                .frame(height: 50)
                                .frame(maxWidth: 300)
                                .background(lightGreen)
                                .cornerRadius(15)
                                .padding(10)
                        })
                }
                .padding(.top, 50)
                
                
            }
        }
    }
    
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
*/

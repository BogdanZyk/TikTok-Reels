//
//  LoginView.swift
//  TikTok Reels (iOS)
//
//  Created by Bogdan Zykov on 02.09.2022.
//

import SwiftUI

struct LoginView: View {
    @State private var showLogin: Bool = true
    @EnvironmentObject var loginVM: LoginViewModel
    var body: some View {
        VStack(spacing: 20){
            Spacer()
            CustomTextField(text: $loginVM.email, promt: "email")
            CustomTextField(text: $loginVM.password, promt: "password", isSecureTF: true)
            
            Button {
                
                if showLogin{
                    loginVM.logIn()
                }else{
                    loginVM.createAccount {
                        loginVM.isloggedUser = true
                    }
                }
                
            } label: {
                Text(showLogin ? "Log In" : "Create Account")
                    .foregroundColor(.black)
                    .frame(height: 44)
                    .hCenter()
                    .background(Color.white, in: Capsule())
            }
            
            Spacer()
            Button {
                showLogin.toggle()
            } label: {
                Text(showLogin ? "sing Up" : "log in" )
                    .foregroundColor(.white)
            }
        }
        .padding()
        .allFrame()
        
        .background(.black)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(LoginViewModel())
    }
}


extension LoginView{
    
  
    
}

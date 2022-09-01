//
//  ContentView.swift
//  Shared
//
//  Created by Bogdan Zykov on 31.08.2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var loginVM: LoginViewModel
    var body: some View {
        if loginVM.isloggedUser{
            MainView()
        }else{
            LoginView()
                .environmentObject(loginVM)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(LoginViewModel())
    }
}

//
//  TikTok_ReelsApp.swift
//  Shared
//
//  Created by Bogdan Zykov on 31.08.2022.
//

import SwiftUI

@main
struct TikTok_ReelsApp: App {
    @StateObject var loginVM = LoginViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(loginVM)
        }
    }
}

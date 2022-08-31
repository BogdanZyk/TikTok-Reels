//
//  MainView.swift
//  TikTok Reels (iOS)
//
//  Created by Bogdan Zykov on 31.08.2022.
//

import SwiftUI

struct MainView: View {
    
    init(){
        UITabBar.appearance().isHidden = true
    }
    @State private var currentTab: Tab = .home
    
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $currentTab) {
              
                ReelsView()
                    .tag(Tab.home)
                
                Text("Discover")
                    .tag(Tab.search)
                
                Text("Add")
                    .tag(Tab.addPrimary)
                
                Text("Message")
                    .tag(Tab.message)
                
                Text("Account")
                    .tag(Tab.account)
            }
            tabBar
                
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

extension MainView{
    
    
    private var tabBar: some View{
        HStack{
            ForEach(Tab.allCases, id: \.self){ tab in
                Button {
                    currentTab = tab
                } label: {
                    Image(tab.rawValue)
                        .frame(maxWidth: .infinity)
                }
            }
            .padding(.vertical, 10)
            
        }
        .background(Color.black)
    }
}


enum Tab: String, CaseIterable{
    case home, account, addPrimary, message, search
}

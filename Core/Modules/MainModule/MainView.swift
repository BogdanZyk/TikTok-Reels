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
              
                HomeView()
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
                    VStack(spacing: 5) {
                        Image(tab.rawValue)
                            .frame(maxWidth: .infinity)
                            .frame(height: 30)
                            Text(tab.title)
                                .foregroundColor(.white)
                                .font(.system(size: 12))
                        
                    }
                }
            }
            .padding(.vertical, 10)
            
        }
        .background(Color.black)
    }
}


enum Tab: String, CaseIterable{
    case home, search, addPrimary, message, account
    
    var title: String{
        switch self {
        case .home:
            return "Home"
        case .search:
            return "Discover"
        case .addPrimary:
            return ""
        case .message:
            return "Inbox"
        case .account:
            return "Me"
        }
    }
}

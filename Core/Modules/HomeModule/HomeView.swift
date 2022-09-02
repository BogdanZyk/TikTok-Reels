//
//  ReelsView2.swift
//  TikTok Reels (iOS)
//
//  Created by Bogdan Zykov on 02.09.2022.
//


import SwiftUI


struct HomeView: View {
    @StateObject private var reelVM = HomeViewModel()
    @State private var currentVideoId = ""
    
    @State private var mainPlay: Bool = true
    
    var body: some View {
        
        GeometryReader { proxy in
            let size = proxy.size
            ZStack(alignment: .leading){
                
                TabView(selection: $currentVideoId) {
                    ForEach(reelVM.videos){video in
                        ReelsPlayer2(size: size, mainPlay: mainPlay, currentVideoId: $currentVideoId, video: video)
                            .frame(width: size.width)
                            .rotationEffect(.degrees(-90))
                            .ignoresSafeArea(.all, edges: .top)
                            .tag(video.id)
                    }
                }
                Text("test")
                    .padding(20)
            }
            .rotationEffect(.degrees(90))
            .frame(width: size.height)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(width: size.width)
        }
        .ignoresSafeArea(.all, edges: .top)
        .background(Color.black.ignoresSafeArea())
        .onAppear{
            currentVideoId = reelVM.videos.first?.id ?? ""
        }
    }
}

struct ReelsView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(LoginViewModel())
            
    }
}









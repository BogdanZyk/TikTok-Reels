//
//  ReelsView2.swift
//  TikTok Reels (iOS)
//
//  Created by Bogdan Zykov on 02.09.2022.
//


import SwiftUI


struct HomeView: View {
    @Environment(\.safeAreaInsets) var safeAreaInsets
    @StateObject private var reelVM = HomeViewModel()
    @State private var currentVideoId = ""
    
    @State private var mainPlay: Bool = true
    
    var body: some View {
        ZStack(alignment: .top){
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
                   
                }
                .rotationEffect(.degrees(90))
                .frame(width: size.height)
                .tabViewStyle(.page(indexDisplayMode: .never))
                .frame(width: size.width)
            }
            topTabView
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

extension HomeView{
    private var topTabView: some View{
        
        HStack{
            Button {
                
            } label: {
                Image("live")
                    .padding(10)
            }
            Spacer()
            Text("Following")
                .foregroundColor(.white.opacity(0.8))
            Text("For you")
                .bold()
            Spacer()
            Button {
                
            } label: {
                Image("discover")
                    .padding(10)
            }
            
        }
        .foregroundColor(.white)
        .font(.subheadline)
        .padding(.horizontal, 10)
        .padding(.top, safeAreaInsets.top)
    }
}








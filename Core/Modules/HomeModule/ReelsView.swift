//
//  ReelsView.swift
//  TikTok Reels (iOS)
//
//  Created by Bogdan Zykov on 31.08.2022.
//
//
//import SwiftUI
//import AVKit
//
//struct ReelsView: View {
//    @StateObject private var reelVM = ReelsViewModel()
//    @State private var currentReel = ""
//    
//    @State private var reels = MediaFileJSON.map { item -> Reel in
//        let url = Bundle.main.path(forResource: item.url, ofType: "mp4", inDirectory: "videos") ?? ""
//        let player = AVPlayer(url: URL(fileURLWithPath: url))
//        
//        return Reel(player: player, mediaFile: item)
//    }
//    
//    var body: some View {
//        
//        GeometryReader { proxy in
//            let size = proxy.size
//            TabView(selection: $currentReel) {
//                ForEach($reels){reel in
//                    ReelsPlayer(size: size, currentReel: $currentReel, reel: reel)
//                    .frame(width: size.width)
//                    .rotationEffect(.degrees(-90))
//                    .ignoresSafeArea(.all, edges: .top)
//                    .tag(reel.id)
//                }
//            }
//            .rotationEffect(.degrees(90))
//            .frame(width: size.height)
//            .tabViewStyle(.page(indexDisplayMode: .never))
//            .frame(width: size.width)
//        }
//        .ignoresSafeArea(.all, edges: .top)
//        .background(Color.black.ignoresSafeArea())
//        .onAppear{
//            currentReel = reels.first?.id ?? ""
//        }
//    }
//}
//
//struct ReelsView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
//
//
//struct ReelsPlayer: View{
//    var size: CGSize
//    @Binding var currentReel: String
//    @State private var isPlay: Bool = true
//    @State private var showMore = false
//    @State private var isOpacity = false
//    @Binding var reel: Reel
//    var body: some View{
//        ZStack{
//            if let player = reel.player{
//                CustomVideoPlayer(player: player)
//                    .onTapGesture {
//                        if player.timeControlStatus == .playing {
//                            player.pause()
//                        }else{
//                            player.play()
//                        }
//                        
//                    }
//                GeometryReader { proxy -> Color in
//                    let minY = proxy.frame(in: .global).minY
//                    
//                    DispatchQueue.main.async {
//                        
//                        
//                        if -minY < 1 && minY < 1{
//                            withAnimation(.easeInOut(duration: 0.25)) {
//                                isOpacity = false
//                            }
//             
//                        }else{
//                            withAnimation(.easeInOut(duration: 0.25)) {
//                                isOpacity = true
//                            }
//                            
//                          
//                        }
//                        
//                        
//                        if -minY < (size.height / 2) && minY < (size.height / 2) && currentReel == reel.id{
//                            player.play()
//                        }else{
//                            
//                            player.pause()
//                        }
//                    }
//                    
//                    return Color.clear
//                }
//                VStack{
//                    HStack(alignment: .bottom) {
//                        reelInfoViewsection
//                        reelActionButtons
//                    }
//                }
//                .padding(.horizontal, 10)
//                .padding(.bottom, 10)
//                .foregroundColor(.white)
//                .frame(maxHeight: .infinity, alignment: .bottom)
//                .opacity(isOpacity ? 0.5 : 1)
////                .onChange(of: player.timeControlStatus) { status in
////                    isPlay = status == .playing ? true : false
////                }
////                if player.rate != 0 && player.error == nil{
////                    Image(systemName: "play.fill")
////                        .font(.title)
////                        .foregroundColor(.white)
////                }
//            }
//        }
//    }
//}
//
//extension ReelsPlayer{
//    private var reelInfoViewsection: some View{
//        VStack(alignment: .leading, spacing: 8) {
//            HStack(spacing: 2) {
//                Text("@karennne")
//                    .fontWeight(.semibold)
//                Text("· 1-28")
//                    .foregroundColor(.white.opacity(0.5))
//            }
//            Text(reel.mediaFile.title)
//                .font(.callout)
//                .fontWeight(.semibold)
//            Text("Roddy Roundicch - The Rou")
//                .font(.system(size: 15))
//        }
//        .frame(maxWidth: .infinity, alignment: .leading)
//    }
//    
//    private var reelActionButtons: some View{
//        VStack(spacing: 25){
//            Circle()
//                .fill(.gray)
//                .frame(width: 47, height: 47)
//            actionButton(image: "heartFill", value: "3445")
//            actionButton(image: "messageIcon", value: "124")
//            actionButton(image: "shareIcon", value: "Share")
//            Circle()
//                .fill(.gray)
//                .frame(width: 47, height: 47)
//        }
//    }
//    
//    private func actionButton(image: String, value: String) -> some View{
//        Button {
//            
//        } label: {
//            VStack(spacing: 10) {
//                Image(image)
//                Text(value)
//                    .font(.system(size: 13))
//            }
//            
//        }
//
//    }
//}
//
//
//extension AVPlayer {
//
//    var isPlaying: Bool {
//        return ((rate != 0) && (error == nil))
//    }
//}

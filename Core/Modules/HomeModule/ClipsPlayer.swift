//
//  ClipsPlayer.swift
//  TikTok Reels (iOS)
//
//  Created by Bogdan Zykov on 02.09.2022.
//
import AVFoundation
import VideoPlayer
import SwiftUI

struct ClipsPlayer: View{
    var clip: Clip
    var size: CGSize
    var mainPlay: Bool
    @State private var autoReplay: Bool = true
    @State private var time: CMTime = .zero
    @Binding var currentClipId: String
    @State private var play: Bool = true
    @State private var isStop: Bool = false
    @State private var showMore = false
    @State private var isOpacity = false
    @State private var totalDuration: Double = 0
    
    var body: some View{
        ZStack{
            if let videoUrl = clip.videoUrl, let url = URL(string: videoUrl){
                VideoPlayer(url: url, play: $play, time: $time)
                    .autoReplay(autoReplay)
                    .onStateChanged { state in
                        switch state {
                        
                        case .playing(let totalDuration):
                            
                        self.totalDuration = totalDuration
                        
                        default:
                            break
                        }
                    }
                    .onPlayToEndTime {
                        resetTimeVideo()
                    }
                    .onTapGesture {
                        
                        play = !play
                        isStop = !play
                        
                    }
                    .onDisappear{
                        play = false
                        isStop = false
                        resetTimeVideo()
                    }
                   
                GeometryReader { proxy -> Color in
                    let minY = proxy.frame(in: .global).minY
                    
                    DispatchQueue.main.async {
                        
                        
                        if (-minY < 1 && minY < 1){
                            
                            //play = true
                            
                            withAnimation(.easeInOut(duration: 0.25)) {
                                isOpacity = false
                            }
             
                        }else{
                            withAnimation(.easeInOut(duration: 0.25)) {
                                isOpacity = true
                            }
                        }
                        if -minY < size.height && minY < 1 && !isStop{
                            play = true
                        }else{
                            play = false
                        }
                    }
                    return Color.clear
                }
                VStack{
                    HStack(alignment: .bottom) {
                        reelInfoViewSection(clip)
                        reelActionButtons
                    }
                }
                .padding(.horizontal, 10)
                .padding(.bottom, 10)
                .foregroundColor(.white)
                .frame(maxHeight: .infinity, alignment: .bottom)
                .opacity(isOpacity ? 0.5 : 1)

                if isStop{
                    Image(systemName: "play.fill")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
            }
        }
        .onChange(of: mainPlay) { isPlay in
            play = isPlay
        }
    }
}

extension ClipsPlayer{
    private func reelInfoViewSection(_ clip: Clip) -> some View{
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 2) {
                Text("@karennne")
                    .fontWeight(.semibold)
                Text("· 1-28")
                    .foregroundColor(.white.opacity(0.5))
            }
            Text(clip.description)
                .font(.callout)
                .fontWeight(.semibold)
            Text("Roddy Roundicch - The Rou")
                .font(.system(size: 15))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var reelActionButtons: some View{
        VStack(spacing: 25){
            Image("plaseholdAvatar")
                .resizable()
                .frame(width: 47, height: 47)
                .overlay(Circle().stroke(lineWidth: 1.3))
                .clipShape(Circle())
            actionButton(image: "heartFill", value: "3445")
            actionButton(image: "messageIcon", value: "124")
            actionButton(image: "shareIcon", value: "Share")
            Image("audioPlacehold")
                .resizable()
                .frame(width: 47, height: 47)
                .overlay(Circle().stroke(lineWidth: 20).fill(Color.black.opacity(0.8)))
                .clipShape(Circle())
        }
    }
    
    private func actionButton(image: String, value: String) -> some View{
        Button {
            
        } label: {
            VStack(spacing: 10) {
                Image(image)
                Text(value)
                    .font(.system(size: 13))
            }
            
        }
    }
    private func resetTimeVideo(){
        self.time = CMTimeMakeWithSeconds(0.0, preferredTimescale: self.time.timescale)
    }
}

struct ReelsPlayer2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(LoginViewModel())
    }
}
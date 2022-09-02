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
                        clipPrimaryButtons(clip)
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
                Button {
                    
                } label: {
                    Text(clip.athor?.userName ?? "noName")
                        .font(.proximaSemibold(size: 16))
                }
                Text("· 1-28")
                    .foregroundColor(.white.opacity(0.5))
            }
            VStack(alignment: .leading, spacing: 6) {
                Text(clip.description)
                    .font(.proximaRegular(size: 16))
                Text(clip.getHashtag())
                    .font(.proximaSemibold(size: 16))
            }
            musicButton(clip.sound)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private func clipPrimaryButtons(_ clip: Clip) -> some View{
        VStack(spacing: 25){
            authorAvatarButton(clip.athor)
            actionButtons(clip)
            SoundtrackCircleButton(isAnimation: play, soundtrack: clip.sound)
        }
    }
    
    private func authorAvatarButton(_ author: Author?) -> some View{
        Button {
            
        } label: {
            UserAvatarViewComponent(pathImage: author?.avatarPath, size: CGSize.init(width: 47, height: 47))
                .overlay(Circle().stroke(lineWidth: 1.5))
        }
    }
    
    private func actionButtons(_ clip: Clip) -> some View{
        Group{
            ClipActionButton(imageName: "heartFill", value: "\(clip.likeCount)", action: {})
            ClipActionButton(imageName: "messageIcon", value: "\(clip.comments.count)", action: {})
            ClipActionButton(imageName: "shareIcon", value: "Share", action: {})
        }
    }
    private func musicButton(_ sound: Soundtrack?) -> some View{
        Button {
            
        } label: {
            Label {
                Text(sound?.title ?? "Mo name")
                    .font(.proximaRegular(size: 14))
            } icon: {
                Image("music")
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


struct ClipActionButton:  View{
    let imageName: String
    let value: String
    let action: () -> Void
    var body: some View{
        Button {
            
        } label: {
            VStack(spacing: 10) {
                Image(imageName)
                Text(value)
                    .font(.proximaSemibold(size: 16))
                    .foregroundColor(.white)
            }
        }
    }
}

//
//  CustomVideoPlayer.swift
//  TikTok Reels (iOS)
//
//  Created by Bogdan Zykov on 31.08.2022.
//

import SwiftUI
import AVKit


struct CustomVideoPlayer: UIViewControllerRepresentable {
    
    var player: AVPlayer
    
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> some AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.player = player
        controller.showsPlaybackControls = false
        controller.videoGravity = .resizeAspectFill
        player.actionAtItemEnd = .none
        NotificationCenter.default.addObserver(context.coordinator, selector: #selector(context.coordinator.restartPlayBack), name: .AVPlayerItemDidPlayToEndTime, object: player.currentItem)
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    class Coordinator: NSObject{
        var parent: CustomVideoPlayer
        
        init(parent: CustomVideoPlayer) {
            self.parent = parent
        }
        @objc func restartPlayBack(){
            parent.player.seek(to: .zero)
        }
    }
    
}


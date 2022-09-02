//
//  CustomLazyImage.swift
//  TikTok Reels (iOS)
//
//  Created by Bogdan Zykov on 03.09.2022.
//

import SwiftUI
import NukeUI
import Nuke

struct CustomLazyImage: View{
    
    private var url: URL?
    var strUrl: String
    var resizeHeight: CGFloat = 200
    var resizingMode: ImageResizingMode = .aspectFill
    var loadPriority: ImageRequest.Priority = .normal
    private let imagePipeline = ImagePipeline(configuration: .withDataCache)
    
    init(strUrl: String,
         resizeHeight: CGFloat = 200,
         resizingMode: ImageResizingMode = .aspectFill,
         loadPriority: ImageRequest.Priority = .normal){
        self.strUrl = strUrl
        self.resizeHeight = resizeHeight
        self.resizingMode = resizingMode
        self.loadPriority = loadPriority
        self.url = URL(string: strUrl)
    }
    var body: some View{
        Group{
            if let url = url {
                LazyImage(source: url) { state in
                    if let image = state.image {
                        image
                            .resizingMode(resizingMode)// Displays the loaded image
                    }else {
                        Color.gray.opacity(0.8) // Acts as a placeholder
                    }
                }
                .processors([ImageProcessors.Resize.resize(height: resizeHeight)])
                .priority(loadPriority)
                .pipeline(imagePipeline)
                
            }
        }
    }
}

//
//  HomeViewModel.swift
//  TikTok Reels (iOS)
//
//  Created by Bogdan Zykov on 02.09.2022.
//

import Foundation
import Combine

final class HomeViewModel: ObservableObject{
    
    let clipDataService: ClipDataService
    
    @Published var allClips: [Clip] = []
    @Published var errorMessage: String = ""
    @Published var showAlert: Bool = false
    private var cancellable = Set<AnyCancellable>()
    
    init(clipDataService: ClipDataService = ClipDataService()){
        self.clipDataService = clipDataService
        startClipSubscriptions()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
//            self.uploadData()
//        }
    }
    
    
//        func uploadData(){
//    //        addData(course: MockData.dailyCourse)
//            MockData.clips.forEach { clip in
//                addData(clip)
//            }
//        }
//
//
//        func addData(_ clip: Clip){
//            do {
//                try FirebaseManager.shared.firestore
//                    .collection(FbConstants.All_CLIPS)
//                    .document()
//                    .setData(from: clip, completion: { error in
//                        if let error = error{
//                            print(error.localizedDescription)
//                        }
//                        print("data set")
//                    })
//                print("data set finish")
//
//            } catch let error{
//                print(error.localizedDescription)
//            }
//
//        }
    
    func startClipSubscriptions(){
        clipDataService.$allClips
            .assign(to: \.allClips, on: self)
            .store(in: &cancellable)
    }
    
//    func fetchVideos(){
//        FirebaseManager.shared.firestore
//            .collection("videos")
//            .getDocuments {[weak self] (documentSnapshot, error) in
//                guard let self = self else {return}
//                self.handleError(error, title: "Failed to fetch Recomended Course")
//                documentSnapshot?.documents.forEach({ snapshot in
//                    do{
//                        let returnedVideo = try snapshot.data(as: Video.self)
//                        self.videos.append(returnedVideo)
//                    }catch{
//                        self.handleError(error, title: "Failed to decode course data")
//
//                    }
//                })
//            }
//    }
    
    private func handleError(_ error: Error?, title: String){
        
        Helpers.handleError(error, title: title, errorMessage: &errorMessage, showAlert: &showAlert)
    }
    
}

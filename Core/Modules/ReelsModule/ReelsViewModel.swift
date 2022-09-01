//
//  ReelsViewModel.swift
//  TikTok Reels (iOS)
//
//  Created by Bogdan Zykov on 02.09.2022.
//

import Foundation


final class ReelsViewModel: ObservableObject{
    
    @Published var videos: [Video] = []
    @Published var errorMessage: String = ""
    @Published var showAlert: Bool = false
    
    
    init(){
        //videos = MockData.videos
        fetchVideos()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
//            self.uploadData()
//        }
    }
    
    
//        func uploadData(){
//    //        addData(course: MockData.dailyCourse)
//            MockData.videos.forEach { video in
//                addData(video)
//            }
//        }
//
//
//        func addData(_ video: Video){
//            do {
//                try FirebaseManager.shared.firestore
//                    .collection("videos")
//                    .document()
//                    .setData(from: video, completion: { error in
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
    
    func fetchVideos(){
        FirebaseManager.shared.firestore
            .collection("videos")
            .getDocuments {[weak self] (documentSnapshot, error) in
                guard let self = self else {return}
                self.handleError(error, title: "Failed to fetch Recomended Course")
                documentSnapshot?.documents.forEach({ snapshot in
                    do{
                        let returnedVideo = try snapshot.data(as: Video.self)
                        self.videos.append(returnedVideo)
                    }catch{
                        self.handleError(error, title: "Failed to decode course data")
                        
                    }
                })
            }
    }
    
    private func handleError(_ error: Error?, title: String){
        
        Helpers.handleError(error, title: title, errorMessage: &errorMessage, showAlert: &showAlert)
    }
    
}

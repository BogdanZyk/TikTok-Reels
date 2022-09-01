//
//  LoginViewModel.swift
//  TikTok Reels (iOS)
//
//  Created by Bogdan Zykov on 02.09.2022.
//

import Foundation
import UIKit

final class LoginViewModel: ObservableObject {
    
    @Published var isloggedUser: Bool = false
    @Published var userName: String = ""
    @Published var password: String = ""
    //@Published var userImage: UIImageData?
    @Published var email: String = ""
    @Published var isLoading: Bool = false
    @Published var showAlert: Bool = false
    @Published var error: Error?
    
    let userDataService: UserDataService
    
    init(userDataService: UserDataService =  UserDataService()){
        self.userDataService = userDataService
        checkLoginStatus()
    }
    
    
    public var isValidLoginForms: Bool{
        !email.isEmpty && !password.isEmpty
    }
    
    
    private func checkLoginStatus(){
        isloggedUser = FirebaseManager.shared.auth.currentUser?.uid != nil
    }
    
    public func logIn(){
        isLoading = true
        userDataService.logIn(email: email, password: password) { [weak self] (result) in
            self?.isLoading = false
            self?.handleResult(result)
        }
    }
    
    public func createAccount(completion: @escaping () -> Void){
        isLoading = true
        userDataService.createAccount(email: email, password: password, username: userName) { [weak self] (result) in
            self?.isLoading = false
            switch result{
            case .success(let success):
                if success{
                    completion()
                }
            case .failure(let error):
                self?.handleError(error)
            }
        }
    }
    
    

    
    public func logOut(){
        userDataService.logOut { [weak self] in
            self?.checkLoginStatus()
        }
    }
    
    private func handleError(_ error: Error){
        self.error = error
        showAlert = true
    }
    
    private func handleResult(_ result: Result<Bool, Error>){
        switch result{
        case .success(let success):
            isloggedUser = success
            resetUserInfo()
        case .failure(let error):
            handleError(error)
        }
    }
    
    private func resetUserInfo(){
        email.removeAll()
        password.removeAll()
    }
}


////Save image in server
//extension LoginViewModel{
//
//    public func updateUserInfo(){
//        self.isLoading = true
//        Helpers.uploadImageToFirestore(uiImage: userImage?.image, imagePath: "User_images", path: userImage?.fileName ?? "no name") { [weak self] (url, error) in
//            guard let self = self else {return}
//            self.userDataService.updateUserInformation(userName: self.userName, profileImageUrl: url) { error in
//                self.isLoading = false
//                if let error = error {
//                    self.handleError(error)
//                    return
//                }
//                self.isloggedUser = true
//            }
//        }
//    }
//
//}




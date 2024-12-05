//
//  MainTabViewModel.swift
//  TheCaffeteria
//
//  Created by Sonal on 04/12/24.
//

import Foundation

import SwiftUI

enum ViewState {
    case loading
    case success(Codable)
    case failure(err: String)
}

class MainTabViewModel : ObservableObject {
    var loaderState: ViewState
    
    init(loaderState: ViewState) {
        self.loaderState = loaderState
        
        hitApiToGetUserData()
    }
    
    func hitApiToGetUserData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.loaderState = .success(UserModel())
        }
    }
}

struct UserModel: Codable {
    var name: String?
    var email: String?
    var ph: String?
}

//
//  SplashViewModel.swift
//  TheCaffeteria
//
//  Created by Sonal on 13/12/24.
//

import SwiftUI

class SplashViewModel: ObservableObject {
    @Published var state: ApiRespState = .loading
    static var temp = 0
    
    init() {
        self.hitSplashApi()
    }
    
    func hitSplashApi() {
        self.state = .loading
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            if SplashViewModel.temp > 0 {
                self.state = .success(SplashModel())
            } else {
                self.state = .failure(.custom(error: ""))
            }
            SplashViewModel.temp += 1
        }
    }
}

class SplashModel: Codable {
    var status: String?
}

enum ErrorTypes : Error{
    case network(error:String)
    case custom(error:String)
    case parseError(error:String)
}

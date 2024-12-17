//
//  SplashView.swift
//  TheCaffeteria
//
//  Created by Sonal on 13/12/24.
//

import SwiftUI

struct SplashView: View {
    @StateObject private var viewModel = SplashViewModel()
    
    var body: some View {
        switch viewModel.state {
        case .loading:
            CustomLoaderView()
        case .success(_):
            MainTabView()
        case .failure(_):
//            
            ZStack {
                Color.getColor(color: .dark216)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                VStack {
                    Text("Unexpected error encountered \nplease try after some time")
                        .foregroundStyle(Color.getColor(color: .dark151))
                        .multilineTextAlignment(.center)
                        

                    Button {
                        viewModel.hitSplashApi()
                    } label: {
                        Text("refresh")
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .foregroundStyle(Color.white)
                            .background(Color.black)
                            .clipShape(RoundedRectangle(cornerRadius: 4))
                    }
                }
            }
            .ignoresSafeArea(.all)
        }
    }
}

#Preview {
    SplashView()
}

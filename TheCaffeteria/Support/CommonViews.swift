//
//  CommonViews.swift
//  TheCaffeteria
//
//  Created by Sonal on 20/11/24.
//

import SwiftUI

struct TopSafeSection: View {
    var body: some View {
        VStack(spacing: 0) {
            Color.getColor(color: .primaryRed)
                .frame(height: TOP_INSET-1)
            
            Color.getColor(color: .primaryRed)
                .frame(height: 1)
        }
    }
}

struct BottomSafeSection: View {
    var body: some View {
        VStack(spacing: 0) {
            Color.getColor(color: .primaryRed)
                .frame(height: 1)
            
            Color.getColor(color: .primaryRed)
                .frame(height: BOTTOM_INSET-1)
        }
    }
}

struct NetworkImageView: View {
    var imageUrl: String
    var placeHolderImg: String = "messageNoImage"
    
    var body: some View {
        if imageUrl != "", let uurl = URL(string: imageUrl){
            
            AsyncImage(url: uurl) { phase in
                switch phase {
                case .empty:
                    HStack{
                        Spacer()
                        ProgressView()
                        Spacer()
                    }
                case .success(let image):
                    image
                        .resizable()
                case .failure:
                    Image(systemName: "camera.metering.unknown")
                        .resizable()
                        .scaledToFill()
                        .foregroundStyle(Color.getColor(color: .dark216))
                @unknown default:
                    EmptyView()
                }
            }
        } else {
            Image(systemName: "camera.metering.unknown")
                .resizable()
                .scaledToFill()
                .foregroundStyle(Color.getColor(color: .dark216))
        }
        
    }
}

struct CustomLoaderView: View {
    @State private var isAnimating = false

    var body: some View {
        HStack(spacing: 10) {
            ForEach(0..<3) { index in
                Circle()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(Color.getColor(color: .primaryRed).opacity(0.7))
                    .scaleEffect(isAnimating ? 0.5 : 1.0)
                    .animation(
                        Animation.easeInOut(duration: 0.3)
                            .repeatForever()
                            .delay(Double(index) * 0.1),
                        value: isAnimating
                    )
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.5))
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            isAnimating = true
        }
    }
}

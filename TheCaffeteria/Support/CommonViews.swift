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
            
            Color.getColor(color: .primaryRed).opacity(0.6)
                .frame(height: 1)
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

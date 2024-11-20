//
//  CommonViews.swift
//  TheCaffeteria
//
//  Created by Sonal on 20/11/24.
//

import SwiftUI

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
                    Image(placeHolderImg)
                        .resizable()
                        //.scaledToFill()
                        .foregroundColor(.red)
                @unknown default:
                    EmptyView()
                }
            }
        } else {
            Image(placeHolderImg)
                .resizable()
                .scaledToFill()
                .foregroundColor(.red)
        }
        
    }
}

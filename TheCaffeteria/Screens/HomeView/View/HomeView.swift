//
//  HomeView.swift
//  TheCaffeteria
//
//  Created by Sonal on 27/11/24.
//

import SwiftUI

struct HomeView: View {
    @State private var path: [String] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Color.white
                    .frame(height: TOP_INSET)
                
                todaysOfferView
                
                HStack {
                    Spacer()
                }
                Text("Hello, World!")
                    .padding(16)
                    .background(Color.gray)
                    .cornerRadius(8)
                    .onTapGesture {
                        path.append("RestaurantMenu")
                    }
                    .navigationDestination(for: String.self) { destination in
                        if destination == "RestaurantMenu" {
                            RestaurantMenuView()
                        }
                    }
                
                Spacer()
            }
            .background(Color.white)
            .navigationTitle("Home")
        }
        .ignoresSafeArea(.all)
    }
    
    var todaysOfferView: some View {
        ZStack(alignment: .topLeading) {
            TabView() {
                NetworkImageView(imageUrl: "https://www.foodiesfeed.com/wp-content/uploads/2023/06/burger-with-melted-cheese.jpg", placeHolderImg: "")
                    .scaledToFit()

                NetworkImageView(imageUrl: "https://www.foodiesfeed.com/wp-content/uploads/2023/08/tartelettes-top-view.jpg", placeHolderImg: "")
                    .scaledToFit()
                
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .frame(width: 300, height: 300)
            .background(Color.black)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            
            
            HStack(spacing: 0) {
                Image(systemName: "star.circle.fill")
                    .foregroundStyle(.yellow)
                    .padding(2)
                    .background(Color.red.opacity(0.5))
                    .clipShape(Circle())
                
                Text("today's Offers")
                    .foregroundStyle(.white)
            }.padding(12)
        }
    }
}

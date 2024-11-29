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
            VStack(alignment: .leading,  spacing: 0){
                
                Color.getColor(color: .primaryRed)
                    .frame(height: TOP_INSET)
                
                Color.getColor(color: .primaryRed).opacity(0.6)
                    .frame(height: 1)
                
                topView
                                
                ScrollViewReader { proxy in
                    ScrollView {
                        todaysOfferView
                            .padding(16)

                        FoodCounterSection(path: $path)
                    }
                }
                
                HStack {
                    Spacer()
                }
                
                Spacer()
            }
            .background(Color.gray.opacity(0.2))
            .background(Color.white)
            .navigationTitle("Home")
            .navigationDestination(for: String.self) { destination in
                if destination == "RestaurantMenu" {
                    RestaurantMenuView()
                }
            }
        }
        .ignoresSafeArea(.all)
    }
    
    var topView : some View {
        HStack(spacing: 0) {
            
            Group {
                Image(systemName: "location")
                    .foregroundStyle(Color.white)
                
                Text("noida")
                    .foregroundStyle(Color.white)
                
                Image(systemName: "chevron.down")
                    .foregroundStyle(Color.white)
            }
            
            
            Spacer()
        }
        .padding(.horizontal, 16)
//        .padding(.vertical, 8)
        .frame(height: 40)
        .background(Color.getColor(color: .primaryRed))
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

struct FoodCounterSection: View {
    @Binding var path: [String]
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Image(systemName: "fork.knife.circle.fill")
                    .foregroundStyle(Color.gray)
                
                Text("Explore food counters")
                    .foregroundStyle(Color.gray)
                
                Spacer()
            }
            .padding(.vertical, 8)
            
            foodCounterRow
                .padding(.vertical, 6)
            
            foodCounterRow
                .padding(.vertical, 6)
        }
        .padding(.horizontal, 16)
    }
    
    var foodCounterRow: some View {
        HStack(spacing: 8) {
            NetworkImageView(imageUrl: "https://www.foodiesfeed.com/wp-content/uploads/2023/08/tartelettes-top-view.jpg", placeHolderImg: "")
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .scaledToFit()

            
            VStack(alignment: .leading,spacing: 4) {
                Text("Explore food counters")
                    .foregroundStyle(Color.getColor(color: .dark48))
                
                HStack(spacing: 2){
                    Image(systemName: "star.fill")
                        .foregroundStyle(Color.getColor(color: .primaryRed))
                    Text("4.5")
                        .foregroundStyle(Color.getColor(color: .primaryRed))
                    
                    Circle()
                        .fill(Color.getColor(color: .dark144))
                        .frame(height: 5)
                    
                    Text("pickup")
                        .foregroundStyle(Color.getColor(color: .dark144))
                }
                
                Text("no pending orders")
                    .foregroundStyle(Color.getColor(color: .dark48))

                
                Spacer()
            }
            
            Spacer()
        }
        .onTapGesture {
            path.append("RestaurantMenu") // Trigger navigation
        }
    }
}

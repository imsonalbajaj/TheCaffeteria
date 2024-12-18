//
//  HomeView.swift
//  TheCaffeteria
//
//  Created by Sonal on 27/11/24.
//

import SwiftUI

struct HomeView: View {
    @State private var path: [String] = []
    @State private var moreTapped = false
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack(alignment: .leading,  spacing: 0){
                TopSafeSection()
                
                topView
                
                ScrollViewReader { proxy in
                    ScrollView {
                        todaysOfferView
                            .padding(16)
                        
                        foodCounterSection()
                    }
                }
                
                HStack {
                    Spacer()
                }
                
                Spacer()
                
                homeBottomSection
                BottomSafeSection()
            }
            .overlay {
                if moreTapped {
                    MoreView(moreTapped: $moreTapped)
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                }
            }
            .animation(.easeInOut, value: moreTapped)
            .ignoresSafeArea(.all)
            .navigationDestination(for: String.self) { destination in
                if destination == "CurrOrderView" {
                    CurrOrderView()
                } else if destination == "RestaurantMenu" {
                    RestaurantMenuView()
                } else if destination == "OrdersView" {
                    OrdersView(path: $path)
                } else if destination == "CartView" {
                    CartView()
                }
            }
        }
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
            
            Image(systemName: "magnifyingglass")
                .foregroundStyle(Color.white)
            
        }
        .padding(.horizontal, 16)
        .frame(height: 40)
        .background(Color(color_primary_red))
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
            .shadow(color: Color(color_dark48), radius: 10)
            
            
            
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
    var homeBottomSection: some View {
        HStack(alignment: .center, spacing: 0){
            Spacer()
                .frame(width: 16)
            ForEach(homeViewIcons) { homeViewIcon in
                getTabIcon(img: homeViewIcon.img, txt: homeViewIcon.txt)
                    .frame(maxWidth: .infinity)
                    .onTapGesture {
                        if let destinationView = homeViewIcon.destinationView {
                            path.append(destinationView)
                        } else {
                            if homeViewIcon.txt == "More" {
                                moreTapped.toggle()
                            }
                        }
                    }
            }
            Spacer()
                .frame(width: 16)
        }
        .padding(.top, 8)
        .background(Color(color_primary_red))
    }
    
    @ViewBuilder
    func getTabIcon(img: String, txt: String) -> some View {
        VStack(alignment: .center, spacing: 0) {
            Image(systemName: img)
                .scaledToFit()
                .frame(width: 12, height: 12)
                .padding(.bottom, 4)
            Text(txt)
                .font(.system(size: 14, weight: .medium))
        }
        .foregroundStyle(Color.white)
    }
    
    /* food counter section view's */
    var foodCounterRow: some View {
        HStack(spacing: 8) {
            NetworkImageView(imageUrl: "https://www.foodiesfeed.com/wp-content/uploads/2023/08/tartelettes-top-view.jpg", placeHolderImg: "")
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .scaledToFit()
            
            
            VStack(alignment: .leading,spacing: 4) {
                Text("Explore food counters")
                    .foregroundStyle(Color(color_dark48))
                
                HStack(spacing: 2){
                    Image(systemName: "star.fill")
                        .foregroundStyle(Color(color_primary_red))
                    Text("4.5")
                        .foregroundStyle(Color(color_primary_red))
                    
                    Circle()
                        .fill(Color(color_dark144))
                        .frame(height: 5)
                    
                    Text("pickup")
                        .foregroundStyle(Color(color_dark144))
                }
                
                Text("no pending orders")
                    .foregroundStyle(Color(color_dark48))
                
                Spacer()
            }
            
            Spacer()
        }
        .padding(8)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .onTapGesture {
            path.append("RestaurantMenu") // Trigger navigation
        }
    }
    
    @ViewBuilder
    func foodCounterSection() -> some View {
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
        .padding(.horizontal, 8)
    }
    
}

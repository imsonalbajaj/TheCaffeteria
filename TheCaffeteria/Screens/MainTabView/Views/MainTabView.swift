//
//  MainTabView.swift
//  TheCaffeteria
//
//  Created by Sonal on 27/11/24.
//

import SwiftUI

struct MainTabView: View {
    //    @Environment(\.modelContext) private var modelContext
    //    @Query private var items: [Item]
    @State private var path: [String] = []
    @State private var selectedTab: Int = 0
    
    var body: some View {
        NavigationStack(path: $path){
            TabView(selection: $selectedTab){
                Group {
                    HomeView(path: $path)
                        .tabItem {
                            Image(systemName: "house.fill")
                            Text("Home")
                        }
                        .tag(0)
                    
                    OrdersTabView(path: $path, selectedTab: $selectedTab)
                        .tabItem {
                            Image(systemName: "pencil.and.list.clipboard.rtl")
                            Text("Orders")
                        }
                        .tag(1)
                    
                    CartTabView(path: $path, selectedTab: $selectedTab)
                        .tabItem {
                            Image(systemName: "cart")
                            Text("Cart")
                        }
                        .tag(2)
                    
                    MoreTabView(path: $path, selectedTab: $selectedTab)
                        .tabItem {
                            Image(systemName: "ellipsis")
                            Text("More")
                        }
                        .tag(3)
                }
                .toolbarBackground(Color.getColor(color: .primaryRed), for: .tabBar)
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarColorScheme(.dark, for: .tabBar)
            }
            .navigationDestination(for: String.self) { destination in
                if destination == "CurrOrderView" {
                    CurrOrderView()
                } else if destination == "RestaurantMenu" {
                    RestaurantMenuView()
                } else if destination == "OrdersView" {
                    OrdersView(path: $path)
                } else if destination == "CartView" {
                    CartView()
                } else if destination == "MoreView" {
                    MoreView()
                }
            }
        }
    }
}

#Preview {
    MainTabView()
//        .modelContainer(for: Item.self, inMemory: true)
}

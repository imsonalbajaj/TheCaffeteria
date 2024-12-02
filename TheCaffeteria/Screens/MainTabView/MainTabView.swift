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
    
    var body: some View {
        NavigationStack {
            TabView {
                Group {
                    HomeView()
                        .tabItem {
                            Image(systemName: "house.fill")
                            Text("Home")
                        }
                    
                    OrdersView()
                        .tabItem {
                            Image(systemName: "pencil.and.list.clipboard.rtl")
                            Text("Orders")
                        }
                    
                    CartView()
                        .tabItem {
                            Image(systemName: "cart")
                            Text("Cart")
                        }
                    
                    MoreView()
                        .tabItem {
                            Image(systemName: "ellipsis")
                            Text("More")
                        }
                }
                .toolbarBackground(Color.getColor(color: .primaryRed), for: .tabBar)
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarColorScheme(.dark, for: .tabBar)
            }
        }
    }
}

#Preview {
    MainTabView()
//        .modelContainer(for: Item.self, inMemory: true)
}

//
//  MainTabView.swift
//  TheCaffeteria
//
//  Created by Sonal on 27/11/24.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
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

            
        }
        .accentColor(Color.getColor(color: .secondaryRed)) // Customize the selected tab color
    }
}

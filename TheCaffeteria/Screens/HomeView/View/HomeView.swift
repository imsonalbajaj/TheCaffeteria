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
            }
            .navigationTitle("Home")
        }
    }
}

//
//  RestaurantMenuView.swift
//  TheCaffeteria
//
//  Created by Sonal on 19/11/24.
//

import SwiftUI

struct RestaurantMenuView: View {
    @StateObject private var viewModel = RestaurantMenuViewModel()
    @State private var searchText = ""
    @State private var selectedCategory: String = "01_favourite"
    
    var body: some View {
        VStack(spacing: 0) {
            headerView
            
            if let menuData = viewModel.menuData {
                ScrollViewReader { proxy in
                    ScrollView {
                        VStack(alignment: .leading, spacing: 16) {
                            NetworkImageView(imageUrl: menuData.section.first?.values.first?.itemImage ?? "")
                                .frame(height: 200)
                                .clipped()
                            
                            cafeteriaInfo
                            searchBar
                            categoryPills
                            
                            ForEach(menuData.section) { section in
                                MenuSection(section: section)
                                    .id(section.section)
                            }
                        }
                    }
                    .onChange(of: selectedCategory) {
                        withAnimation {
                            proxy.scrollTo(selectedCategory, anchor: .top)
                        }
                    }
                }
            } else {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            }
        }
        .navigationBarHidden(true)
    }
    
    // MARK: - Header View
    private var headerView: some View {
        HStack {
            Button(action: {}) {
                Image(systemName: "arrow.left")
                    .foregroundColor(Color.getColor(color: .dark48))
            }
            Text("YGKH Tuckshop")
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(Color.getColor(color: .dark48))
            Spacer()
        }
        .padding(16)
        .background(Color.white)
    }
    
    // MARK: - Cafeteria Info
    private var cafeteriaInfo: some View {
        HStack(spacing: 2) {
            Text("Rated")
                .foregroundColor(Color.getColor(color: .dark96))
            
            Text("4.5")
                .foregroundColor(Color.getColor(color: .dark96))
            
            Image(systemName: "star.fill")
                .foregroundColor(Color.getColor(color: .ratingYellow))
            
            Text("by verified user's")
                .foregroundColor(Color.getColor(color: .dark96))
        }
        .padding(16)
    }
    
    // MARK: - Search Bar
    private var searchBar: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.purple)
            TextField("Find items, food categories...", text: $searchText)
                .foregroundColor(.gray)
            Spacer()
            Image(systemName: "slider.horizontal.3")
                .foregroundColor(.purple)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .padding(.horizontal)
    }
    
    // MARK: - Category Pills
    private var categoryPills: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                if let sections = viewModel.menuData?.section {
                    ForEach(sections) { section in
                        CategoryPill(
                            title: section.sectionName,
                            isSelected: selectedCategory == section.section
                        )
                        .onTapGesture {
                            selectedCategory = section.section
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}


// MARK: - Supporting Views
struct CategoryPill: View {
    let title: String
    let isSelected: Bool
    
    var body: some View {
        Text(title)
            .foregroundColor(isSelected ? .purple : .black)
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(isSelected ? Color.purple.opacity(0.1) : Color.clear)
            .cornerRadius(20)
    }
}

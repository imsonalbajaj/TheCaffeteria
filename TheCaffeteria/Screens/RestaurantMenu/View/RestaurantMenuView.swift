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
            // MARK: - Header
            headerView
            
            if let menuData = viewModel.menuData {
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        // MARK: - Hero Image
                        AsyncImage(url: URL(string: menuData.section.first?.values.first?.itemImage ?? "")) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        } placeholder: {
                            Color.gray.opacity(0.3)
                        }
                        .frame(height: 200)
                        .clipped()
                        
                        // MARK: - Cafeteria Info
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Cafeteria Counter")
                                .font(.title3)
                            HStack {
                                Text("Rated")
                                Text("4.5")
                                    .foregroundColor(.purple)
                                Text("by the users in your cafeteria")
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding(.horizontal)
                        
                        // MARK: - Search Bar
                        searchBar
                        
                        // MARK: - Category Pills
                        categoryPills
                        
                        // MARK: - Menu Items Section
                        ForEach(menuData.section) { section in
                            if section.section == selectedCategory {
                                MenuSection(section: section)
                            }
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
                Image(systemName: "chevron.left")
                    .foregroundColor(.purple)
            }
            Text("YGKH Tuckshop")
                .font(.title3)
                .fontWeight(.semibold)
            Spacer()
        }
        .padding()
        .background(Color.white)
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

struct MenuSection: View {
    let section: Section
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(section.sectionName)
                .font(.title3)
                .fontWeight(.semibold)
                .padding(.horizontal)
            
            ForEach(section.values) { item in
                MenuItemRow(item: item)
            }
        }
    }
}

struct MenuItemRow: View {
    let item: MenuItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Image(systemName: "heart")
                        .foregroundColor(.gray)
                    Image(systemName: "leaf.fill")
                        .foregroundColor(.green)
                }
                
                Text(item.itemName)
                    .font(.system(size: 16, weight: .medium))
                
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.purple)
                    Text(item.itemRating)
                        .foregroundColor(.purple)
                    Text("(\(item.itemReviewsCount))")
                        .foregroundColor(.gray)
                }
                
                Text(item.itemPrice)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.purple)
            }
            
            Spacer()
            
            Button(action: {}) {
                Text("ADD")
                    .fontWeight(.medium)
                    .foregroundColor(.purple)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 8)
                    .background(Color.purple.opacity(0.1))
                    .cornerRadius(8)
            }
        }
        .padding()
        .background(Color.white)
    }
}

//
//  RestaurantMenuView.swift
//  TheCaffeteria
//
//  Created by Sonal on 19/11/24.
//

import SwiftUI

struct RestaurantMenuView: View {
    @StateObject private var viewModel = RestaurantMenuViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            Rectangle()
                .frame(height: TOP_INSET)
            
            if let menuData = viewModel.menuData {
                headerView
                    .frame(height: 40)
                    .background(Color.getColor(color: .secondaryRed))
                    .onAppear {
                        print(TOP_INSET)
                    }
                
                if let sectionArr = menuData.section, sectionArr.count > 0 {
                    ZStack(alignment: .top) {
                        ScrollViewReader { proxy in
                            ScrollView {
                                VStack(alignment: .leading, spacing: 0) {
                                    NetworkImageView(imageUrl: menuData.restarantImg ?? "")
                                        .frame(height: 200)
                                        .clipped()
                                    
                                    cafeteriaInfo
                                    
                                    GeometryReader { geometry in
                                        Color.clear
                                            .frame(height: 0)
                                            .onChange(of: geometry.frame(in: .global)) {
                                                if ((Int(geometry.frame(in: .global).midY) - Int(TOP_INSET) - 40) < 0) {
                                                    viewModel.showStaticSearchBar = true
                                                } else {
                                                    viewModel.showStaticSearchBar = false
                                                }
                                            }
                                    }
                                    .frame(height: 0)
                                    
                                    ZStack {
                                        VStack(spacing: 0) {
                                            searchBar
                                            categoryPills
                                        }
                                        if viewModel.showStaticSearchBar {
                                            Color.white
                                        }
                                    }
                                    
                                    ForEach(sectionArr) { section in
                                        if section.values?.count ?? 0 > 0 {
                                            MenuSection(section: section)
                                                .id(section.section)
                                            
                                        } else {
                                            EmptyView()
                                        }
                                    }
                                }
                            }
                            .onChange(of: viewModel.selectedCategory) {
                                withAnimation {
                                    proxy.scrollTo(viewModel.selectedCategory, anchor: .top)
                                }
                            }
                        }
                        
                        if viewModel.showStaticSearchBar {
                            VStack(spacing: 0) {
                                searchBar
                                categoryPills
                            }
                        }
                    }
                } else {
                    Text("Not available")
                }
                
            } else {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            }
        }
        .navigationBarHidden(true)
        .ignoresSafeArea(edges: .top)
    }
    
    // MARK: - Header View
    private var headerView: some View {
        HStack {
            Button {
            } label: {
                Image(systemName: "arrow.left")
                    .foregroundColor(Color.white)
            }

            Text(viewModel.menuData?.restarantName ?? "")
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(Color.white)
            Spacer()
        }
        .padding(16)
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
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
    }
    
    // MARK: - Search Bar
    private var searchBar: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(Color.getColor(color: .secondaryRed))
            TextField("Find items, food categories...", text: $viewModel.searchText)
                .foregroundColor(.gray)
            Spacer()
        }
        .padding(16)
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .background(Color.white)
    }
    
    // MARK: - Category Pills
    @ViewBuilder
    private var categoryPills: some View {
        if let sectionArr = viewModel.menuData?.section {
            ScrollViewReader { proxy in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(sectionArr) { section in
                            CategoryPill(
                                title: section.sectionName ?? "",
                                isSelected: viewModel.selectedCategory == section.section
                            )
                            .onTapGesture {
                                viewModel.selectedCategory = section.section ?? ""
                            }
                        }
                        
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 4)
                .background(Color.white)
                .onChange(of: viewModel.selectedCategory) {
                    withAnimation {
                        proxy.scrollTo(viewModel.selectedCategory, anchor: .top)
                    }
                }
                .onAppear {
                    withAnimation {
                        proxy.scrollTo(viewModel.selectedCategory, anchor: .center)
                    }
                }
            }
            
        } else {
            EmptyView()
        }
    }
}


// MARK: - Supporting Views
struct CategoryPill: View {
    let title: String
    let isSelected: Bool
    
    var body: some View {
        Text(title)
            .foregroundColor(isSelected ? Color.getColor(color: .secondaryRed) : .black)
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(isSelected ? Color.getColor(color: .secondaryRed).opacity(0.1) : Color.clear)
            .cornerRadius(20)
    }
}

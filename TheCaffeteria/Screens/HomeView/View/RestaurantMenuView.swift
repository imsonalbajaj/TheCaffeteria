//
//  RestaurantMenuView.swift
//  TheCaffeteria
//
//  Created by Sonal on 19/11/24.
//

import SwiftUI

struct RestaurantMenuView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel = RestaurantMenuViewModel()
    @FocusState private var searchBarFocusState: Int?
    
    var body: some View {
        VStack(spacing: 0) {
            TopSafeSection()

            if let menuData = viewModel.menuData {
                headerView
                    .frame(height: 40)
                    .background(Color(color_primary_red))
                
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
                                    
                                    VStack(spacing: 0) {
                                        searchBar
                                            .focused($searchBarFocusState, equals: 1)
                                            .onTapGesture {
                                                searchBarFocusState = 1
                                            }
                                        categoryPills
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
                                    .focused($searchBarFocusState, equals: 2)
                                    .onTapGesture {
                                        searchBarFocusState = 2
                                    }
                                categoryPills
                            }
                            .onAppear{
                                if let val = searchBarFocusState, val == 1 {
                                    searchBarFocusState = 2
                                }
                            }
                        } else {
                            Color.clear.frame(height: 0)
                                .onAppear{
                                    if let val = searchBarFocusState, val == 2 {
                                        searchBarFocusState = 1
                                    }
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
        .background(Color.white)
        .navigationBarHidden(true)
        .ignoresSafeArea(edges: .top)
        .onTapGesture {
            searchBarFocusState = nil
        }
    }
    
    // MARK: - Header View
    private var headerView: some View {
        HStack {
            Button {
                dismiss()
            } label: {
                Image(systemName: "arrow.left")
                    .foregroundStyle(Color.white)
            }
            
            Text(viewModel.menuData?.restarantName ?? "")
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundStyle(Color.white)
            Spacer()
        }
        .padding(16)
    }
    
    // MARK: - Cafeteria Info
    private var cafeteriaInfo: some View {
        HStack(spacing: 2) {
            Text("Rated")
                .foregroundStyle(Color(color_dark96))
            
            Text("4.5")
                .foregroundStyle(Color(color_dark96))
            
            Image(systemName: "star.fill")
                .foregroundStyle(Color.getColor(color: .ratingYellow))
            
            Text("by verified user's")
                .foregroundStyle(Color(color_dark96))
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
    }
    
    // MARK: - Search Bar
    private var searchBar: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(Color(color_primary_red))
            ZStack {
                TextField("", text: $viewModel.searchText)
                    .foregroundStyle(Color(color_dark48))
                    .disableAutocorrection(true)
                    .keyboardType(.namePhonePad)
                
                if viewModel.searchText.count < 1 {
                    Text("Find items, food categories...")
                        .foregroundStyle(Color(color_dark96))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }

            }
            Spacer()
        }
        .padding(16)
        .background(Color(color_dark241))
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

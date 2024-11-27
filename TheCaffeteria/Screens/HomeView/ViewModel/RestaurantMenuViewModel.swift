//
//  RestaurantMenuViewModel.swift
//  TheCaffeteria
//
//  Created by Sonal on 19/11/24.
//

import SwiftUI

class RestaurantMenuViewModel : ObservableObject {
    @Published var menuData: MenuData?
    @Published var searchText = ""
    @Published var selectedCategory: String = "01_favourite"
    @Published var showStaticSearchBar = false
    @Published var geometryValue: CGRect = .zero // State to track geometry value
    
    init() {
        menuData = Utility.loadJSON(fromFile: "chaisutta")
    }
}

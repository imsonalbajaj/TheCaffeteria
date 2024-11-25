//
//  RestaurantMenuViewModel.swift
//  TheCaffeteria
//
//  Created by Sonal on 19/11/24.
//

import SwiftUI

class RestaurantMenuViewModel : ObservableObject {
    @Published var menuData: MenuData?
    @State var searchText = ""
    @State var selectedCategory: String = "01_favourite"
    @State var showStaticSearchBar = false
    @State var geometryValue: CGRect = .zero // State to track geometry value
    
    init() {
        menuData = Utility.loadJSON(fromFile: "chaisutta")
    }
}

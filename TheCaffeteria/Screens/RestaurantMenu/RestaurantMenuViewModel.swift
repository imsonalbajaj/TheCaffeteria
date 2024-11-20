//
//  RestaurantMenuViewModel.swift
//  TheCaffeteria
//
//  Created by Sonal on 19/11/24.
//

import Foundation

class RestaurantMenuViewModel : ObservableObject {
    @Published var menuData: MenuData?
    
    init() {
        menuData = Utility.loadJSON(fromFile: "chaisutta")
    }
}

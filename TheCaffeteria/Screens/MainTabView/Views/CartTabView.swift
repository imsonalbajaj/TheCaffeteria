//
//  CartTabView.swift
//  TheCaffeteria
//
//  Created by Sonal on 03/12/24.
//

import SwiftUI

struct CartTabView: View {
    @Binding var path: [String]
    @Binding var selectedTab: Int
    
    var body: some View {
        Color.white.frame(maxWidth: .infinity, maxHeight: .infinity)
            .onAppear{
                selectedTab = 0
                path.append("CartView")
            }
    }
}

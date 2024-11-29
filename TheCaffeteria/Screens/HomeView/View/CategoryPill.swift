//
//  CategoryPill.swift
//  TheCaffeteria
//
//  Created by Sonal on 26/11/24.
//

import SwiftUI

struct CategoryPill: View {
    let title: String
    let isSelected: Bool
    
    var body: some View {
        Text(title)
            .foregroundStyle(isSelected ? Color.getColor(color: .primaryRed) : .black)
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(isSelected ? Color.getColor(color: .primaryRed).opacity(0.1) : Color.clear)
            .cornerRadius(20)
    }
}

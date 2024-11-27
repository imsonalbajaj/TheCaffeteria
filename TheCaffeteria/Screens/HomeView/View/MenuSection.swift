//
//  MenuSection.swift
//  TheCaffeteria
//
//  Created by Sonal on 20/11/24.
//

import SwiftUI

struct MenuSection: View {
    let section: Section
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(section.sectionName ?? "")
                .font(.title3)
                .fontWeight(.semibold)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
            
            if let arr = section.values {
                ForEach(arr) { item in
                    MenuItemRow(item: item)
                }
            }
            
            Rectangle()
                .fill(Color.getColor(color: .dark216).opacity(0.4))
                .frame(height: 0.5)
        }
    }
}

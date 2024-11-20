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

//
//  MenuItemRow.swift
//  TheCaffeteria
//
//  Created by Sonal on 26/11/24.
//

import SwiftUI

struct MenuItemRow: View {
    let item: MenuItem
    
    var body: some View {
        HStack(alignment: .top){
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Image(systemName: "heart")
                        .foregroundStyle(.gray)
                        .padding(.trailing, 4)
                    Image(systemName: "leaf.circle.fill")
                        .foregroundStyle(.green)
                }
                
                Text(item.itemName ?? "")
                    .font(.system(size: 16, weight: .medium))
                    .fontWeight(.medium)
                    .foregroundStyle(Color.getColor(color: .dark48))
                
                HStack(spacing: 2){
                    Image(systemName: "star.fill")
                        .foregroundStyle(Color.getColor(color: .ratingYellow))
                    Text(item.itemRating ?? "")
                        .foregroundStyle(Color.getColor(color: .dark144))
                    Text("(\(item.itemReviewsCount ?? ""))")
                        .foregroundStyle(Color.getColor(color: .dark144))
                }
                
                Text(item.itemPrice ?? "")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundStyle(Color.getColor(color: .secondaryRed))
            }
            
            Spacer()
            
            VStack(alignment: .center, spacing: 0) {
                NetworkImageView(imageUrl: item.itemImage ?? "", placeHolderImg: "")
                    .scaledToFill()
                    .frame(width: 150, height: 120)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.getColor(color: .dark216), lineWidth: 0.1)
                    )
                
                addBtn
                    .offset(y: -25)
                    .padding(.bottom, -25)
            }
            
            
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
        .background(Color.white)
    }
    
    private var addBtn: some View {
        ZStack {
            HStack(spacing: 6){
                Text("-")
                    .fontWeight(.medium)
                    .foregroundStyle(Color.white)
                    .onTapGesture {
                    }
                
                Text("ADD")
                    .fontWeight(.medium)
                    .foregroundStyle(Color.white)
                
                Text("+")
                    .fontWeight(.medium)
                    .foregroundStyle(Color.white)
                    .onTapGesture {
                    }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            
            HStack(spacing: 0) {
                Color.clear
                    .frame(width: 35)
                    .onTapGesture {
                        print("- on ")
                    }
                
                Spacer()
                
                Color.clear
                    .frame(width: 35)
                    .onTapGesture {
                        print("+ on ")
                    }
            }
        }
        .frame(width: 100,height: 40)
        .background(Color.getColor(color: .secondaryRed).opacity(1))
        .background(Color.white)
        .cornerRadius(8)
    }
}

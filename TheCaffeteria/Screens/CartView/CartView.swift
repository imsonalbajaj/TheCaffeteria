//
//  CartView.swift
//  TheCaffeteria
//
//  Created by Sonal on 28/11/24.
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

struct CartView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            TopSafeSection()
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    topView
                    HStack(spacing: 10) {
                        Image(systemName: "house.fill")
                            .foregroundStyle(Color.getColor(color: .primaryRed))
                        
                        Text("The Samosa's")
                            .foregroundStyle(Color.getColor(color: .dark48))
                            .lineLimit(1)
                        
                        Spacer()
                    }
                    .padding(12)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        itemView()
                        
                        itemView()
                    }.padding(10)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.getColor(color: .dark216), lineWidth: 0.5)
                        )
                        .padding(12)
                    
                    Spacer()
                }
            }
            Spacer()
            
            BottomSafeSection()
        }
        
        .background(Color.getColor(color: .dark241))
        .ignoresSafeArea(.all)
    }
    
    var topView : some View {
        ZStack(alignment: .leadingFirstTextBaseline){
            HStack(spacing: 0) {
                Spacer()
                
                Text("Your Order History")
                    .foregroundStyle(Color.white)
                
                Spacer()
                
            }
            .frame(height: 40)
            .background(Color.getColor(color: .primaryRed))
            
            Image(systemName: "arrow.backward").padding(.leading, 16)
                .foregroundStyle(Color.white)
                .onTapGesture {
                    dismiss()
                }
        }
        .navigationBarHidden(true)
        .ignoresSafeArea(edges: .all)
        
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
        .background(Color.getColor(color: .primaryRed).opacity(1))
        .background(Color.white)
        .cornerRadius(8)
    }
    
    @ViewBuilder
    func itemView() -> some View {
        HStack(spacing: 6) {
            Image(systemName: "circle.square.fill")
                .foregroundStyle(Color.getColor(color: .primaryRed))
            
            Text("Water ")
                .foregroundStyle(Color.getColor(color: .dark48))
                .lineLimit(1)
            
            Spacer()
            
            Text("$20.00")
                .foregroundStyle(Color.getColor(color: .dark48))
                .lineLimit(1)
            
            addBtn
        }
    }
}

#Preview {
    CartView()
}

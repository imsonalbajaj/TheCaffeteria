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
                    Text("c a  r   t")
                        .foregroundStyle(Color.black)
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
}

#Preview {
    CartView()
}

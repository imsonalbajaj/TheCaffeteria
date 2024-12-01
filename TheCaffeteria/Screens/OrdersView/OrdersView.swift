//
//  OrdersView.swift
//  TheCaffeteria
//
//  Created by Sonal on 27/11/24.
//

import SwiftUI

struct OrdersView: View {
    @State private var path: [String] = []
    var body: some View {
        NavigationStack(path: $path) {
            VStack(alignment: .leading, spacing: 0) {
                TopSafeSection()
                
                topView
                Spacer()
            }
            .background(Color.white)
        }
        .ignoresSafeArea(.all)
    }
    
    var topView : some View {
        HStack(spacing: 0) {
            Spacer()
                
                Text("Your Order History")
                    .foregroundStyle(Color.white)
            
            Spacer()

        }
        .padding(.horizontal, 16)
//        .padding(.vertical, 8)
        .frame(height: 40)
        .background(Color.getColor(color: .primaryRed))
    }
}

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
            VStack(alignment: .leading, spacing: 0){
                TopSafeSection()
                ScrollView {
                    VStack(alignment: .leading, spacing: 0) {
                        
                        
                        topView
                        
                        currOrder
                        currOrder
                    }
                }
                
                Spacer()
            }
//            .background(Color.white)
            .background(Color.getColor(color: .dark241))
            .navigationDestination(for: String.self) { destination in
                if destination == "CurrOrderView" {
                    CurrOrderView()
                }
            }
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
    
    var currOrder: some View {
        ZStack{
            Color.white
                .clipShape(RoundedRectangle(cornerRadius: 8))

            VStack(alignment: .leading, spacing: 0) {
                HStack(alignment: .top, spacing: 0) {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("The Samosa's")
                            .foregroundStyle(Color.getColor(color: .dark48))
                            .padding(.bottom, 10)
                        
                        Text("Chai x 2")
                            .foregroundStyle(Color.getColor(color: .dark144))
                        Text("Samosa x 2")
                            .foregroundStyle(Color.getColor(color: .dark144))
                        Text("Bread pakora")
                            .foregroundStyle(Color.getColor(color: .dark144))
                    }
                    
                    Spacer()
                    
                    HStack {
                        Text("Delivered")
                            .foregroundStyle(Color.getColor(color: .dark144))

                        Image(systemName: "arrow.right.doc.on.clipboard")
                            .foregroundStyle(Color.getColor(color: .dark151))
                            .frame(width: 30, height: 30)
                            .clipShape(Circle())
                            .overlay(
                                Circle().stroke(Color.getColor(color: .dark216))
                            )
                    }
                }
                .padding(.bottom, 10)
                                
                HLine().stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                    .foregroundStyle(Color.getColor(color: .dark216))
                Spacer().frame(height: 10)
                
                Text("DLF caffeteria - noida")
                    .foregroundStyle(Color.getColor(color: .dark144))
                
                Text("1 dec'24, 08:46")
                    .foregroundStyle(Color.getColor(color: .dark144))
            }
            .padding(8)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.getColor(color: .dark216), lineWidth: 1)
            )

        }
        .onTapGesture {
            path.append("CurrOrderView")
        }
        .padding(8)
//        .background(Color.white)
    }
}

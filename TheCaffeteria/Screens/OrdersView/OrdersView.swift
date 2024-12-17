//
//  OrdersView.swift
//  TheCaffeteria
//
//  Created by Sonal on 27/11/24.
//

import SwiftUI

struct OrdersView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var path: [String]
    
    var body: some View {
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
            
            BottomSafeSection()
        }
        
        .background(Color(color_dark241))
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
            .background(Color(color_primary_red))
            
            Image(systemName: "arrow.backward").padding(.leading, 16)
                .foregroundStyle(Color.white)
                .onTapGesture {
                    dismiss()
                }
        }
        .navigationBarHidden(true)
        .ignoresSafeArea(edges: .all)

    }
    
    var currOrder: some View {
        ZStack{
            Color.white
                .clipShape(RoundedRectangle(cornerRadius: 8))

            VStack(alignment: .leading, spacing: 0) {
                HStack(alignment: .top, spacing: 0) {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("The Samosa's")
                            .foregroundStyle(Color(color_dark48))
                            .padding(.bottom, 10)
                        
                        Text("Chai x 2")
                            .foregroundStyle(Color(color_dark144))
                        Text("Samosa x 2")
                            .foregroundStyle(Color(color_dark144))
                        Text("Bread pakora")
                            .foregroundStyle(Color(color_dark144))
                    }
                    
                    Spacer()
                    
                    HStack {
                        Text("Delivered")
                            .foregroundStyle(Color(color_dark144))

                        Image(systemName: "arrow.right.doc.on.clipboard")
                            .foregroundStyle(Color(color_dark151))
                            .frame(width: 30, height: 30)
                            .clipShape(Circle())
                            .overlay(
                                Circle().stroke(Color(color_dark216))
                            )
                    }
                }
                .padding(.bottom, 10)
                                
                HLine().stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                    .foregroundStyle(Color(color_dark216))
                Spacer().frame(height: 10)
                
                Text("DLF caffeteria - noida")
                    .foregroundStyle(Color(color_dark144))
                
                Text("1 dec'24, 08:46")
                    .foregroundStyle(Color(color_dark144))
            }
            .padding(8)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color(color_dark216), lineWidth: 1)
            )

        }
        .onTapGesture {
            path.append("CurrOrderView")
        }
        .padding(8)
//        .background(Color.white)
    }
}

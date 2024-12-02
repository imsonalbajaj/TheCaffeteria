//
//  CurrOrderView.swift
//  TheCaffeteria
//
//  Created by Sonal on 02/12/24.
//

import SwiftUI

struct CurrOrderView: View {
    @Environment(\.dismiss) private var dismiss
    let qtyFrameWidth: CGFloat = 70
    let priceFrameWidth: CGFloat = 70
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            TopSafeSection()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 12){
                    topView
                    
                    orderStatusView
                    
                    detailedBill()
                    
                    paymentInfoView
                    
                    Spacer()
                }
                .background(Color.getColor(color: .dark241))
                
            }
            
            BottomSafeSection()
        }
        
        .background(Color.white)
        .navigationBarHidden(true)
        .ignoresSafeArea(edges: .all)
    }
    
    var topView : some View {
        HStack(spacing: 0) {
            Group {
                Image(systemName: "arrow.backward")
                    .padding(.trailing, 4)
                Text("Order Details")
                    .foregroundStyle(Color.white)
            }
            .onTapGesture {
                dismiss()
            }
            
            Spacer()
            
            
            Group {
                Image(systemName: "paperplane.fill")
                    .padding(.trailing, 4)
                
                Text("get invoice")
                    .foregroundStyle(Color.white)
            }
            
        }
        .padding(.horizontal, 16)
        .frame(height: 40)
        .background(Color.getColor(color: .primaryRed))
    }
    
    var orderStatusView: some View {
        HStack(spacing: 0) {
            ZStack(alignment: .bottomTrailing){
                Image(systemName: "arrow.right.doc.on.clipboard")
                    .foregroundStyle(Color.purple)
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.getColor(color: .dark216))
                    )
                
                Image(systemName: "checkmark.circle.fill")
                    .foregroundStyle(Color.green)
                    .background(Color.white)
                    .clipShape(Circle())
            }
            .padding(.trailing, 20)
            
            
            
            VStack(alignment: .leading, spacing: 0){
                Text("Delivered")
                    .foregroundStyle(Color.getColor(color: .dark48))
                Text("Your order has been collected")
                    .foregroundStyle(Color.getColor(color: .dark96))
                    .lineLimit(1)
            }
            
            Spacer()
            
        }
        .padding(8)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.getColor(color: .dark216), lineWidth: 1)
        )
        .padding(6)
    }
    
    @ViewBuilder
    func detailedBill() -> some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 0) {
                Text("Detailed Bill")
                    .foregroundStyle(Color.getColor(color: .dark48))
                    .lineLimit(1)
                
                Spacer()
                
                Text("1 dec'24, 08:46")
                    .foregroundStyle(Color.getColor(color: .dark144))
            }
            .padding(8)
            
            
            VStack(alignment: .leading, spacing: 10){
                HStack(spacing: 10) {
                    Color.getColor(color: .primaryRed)
                        .frame(width: 2)
                        .padding(.trailing, 10)
                    
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Order ID")
                            .foregroundStyle(Color.getColor(color: .dark48))
                            .lineLimit(1)
                        Text("Order Type")
                            .foregroundStyle(Color.getColor(color: .dark48))
                            .lineLimit(1)
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(":")
                            .foregroundStyle(Color.getColor(color: .dark48))
                            .lineLimit(1)
                        Text(":")
                            .foregroundStyle(Color.getColor(color: .dark48))
                            .lineLimit(1)
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("VADVVAVKAN76")
                            .foregroundStyle(Color.getColor(color: .dark48))
                            .lineLimit(1)
                        Text("Dine in")
                            .foregroundStyle(Color.getColor(color: .dark48))
                            .lineLimit(1)
                    }
                    Spacer()
                }
                .padding(.top, 10)
                
                HStack(spacing: 10) {
                    Image(systemName: "house.fill")
                        .foregroundStyle(Color.getColor(color: .primaryRed))
                    
                    Text("The Samosa's")
                        .foregroundStyle(Color.getColor(color: .dark48))
                        .lineLimit(1)
                }
                .padding(.vertical, 12)
                
                VStack(alignment: .leading, spacing: 0) {
                    HStack(alignment: .top, spacing: 0) {
                        Text("Item".getTruncateStr(with: 15))
                            .foregroundStyle(Color.getColor(color: .dark48))
                            .lineLimit(1)
                        
                        Spacer()
                        
                        Text("Qty.".getTruncateStr(with: 15))
                            .foregroundStyle(Color.getColor(color: .dark48))
                            .lineLimit(1)
                            .padding(.horizontal, 10)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .frame(width: qtyFrameWidth)
                        
                        Text("Price.".getTruncateStr(with: 15))
                            .foregroundStyle(Color.getColor(color: .dark48))
                            .lineLimit(1)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .frame(width: priceFrameWidth)
                    }
                    
                    HLine().stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                        .foregroundStyle(Color.getColor(color: .dark216))
                    
                    getItemOrdered()
                        .padding(.vertical, 4)
                    getItemOrdered()
                        .padding(.vertical, 4)
                    getItemOrdered()
                        .padding(.vertical, 4)
                    
                    getTotalBill()
                        .padding(.vertical, 10)
                }
            }
            .padding(8)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.getColor(color: .dark216), lineWidth: 1)
            )
            .padding(6)
        }
    }
    
    var paymentInfoView: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Paid Via")
                .foregroundStyle(Color.getColor(color: .dark48))
                .lineLimit(1)
                .padding(8)
            
            
            HStack(spacing: 0) {
                Color.getColor(color: .primaryRed)
                    .frame(width: 2)
                    .padding(.trailing, 10)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Paid Via")
                        .foregroundStyle(Color.getColor(color: .dark48))
                        .lineLimit(1)
                    Text("Amount")
                        .foregroundStyle(Color.getColor(color: .dark48))
                        .lineLimit(1)
                    Text("Trans ID")
                        .foregroundStyle(Color.getColor(color: .dark48))
                        .lineLimit(1)
                    Text("Status")
                        .foregroundStyle(Color.getColor(color: .dark48))
                        .lineLimit(1)
                    Text("Transaction Type")
                        .foregroundStyle(Color.getColor(color: .dark48))
                        .lineLimit(1)
                }
                .padding(.trailing, 10)
                
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Sodexo")
                        .foregroundStyle(Color.getColor(color: .dark48))
                        .lineLimit(1)
                    Text("$20.0")
                        .foregroundStyle(Color.getColor(color: .dark48))
                        .lineLimit(1)
                    Text("INOCINW8098IO")
                        .foregroundStyle(Color.getColor(color: .dark144))
                        .lineLimit(1)
                    Text("Success")
                        .foregroundStyle(Color.getColor(color: .foodPrimaryGreen))
                        .lineLimit(1)
                    Text("Order")
                        .foregroundStyle(Color.getColor(color: .dark144))
                        .lineLimit(1)
                }
                
                Spacer()
                
            }
            .padding(8)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.getColor(color: .dark216), lineWidth: 1)
            )
            .padding(6)
        }
    }
    
    @ViewBuilder
    func getItemOrdered() -> some View {
        HStack(alignment: .top, spacing: 0) {
            VStack(alignment: .leading, spacing: 0){
                Text("tea x 1".getTruncateStr(with: 15))
                    .foregroundStyle(Color.getColor(color: .dark48))
                    .lineLimit(1)
                
                Text("Delievered")
                    .foregroundStyle(Color.getColor(color: .mbGreenSelectedBorder))
                    .lineLimit(1)
                    .padding(.vertical, 2)
                    .padding(.horizontal, 8)
                    .background(Color.getColor(color: .mbGreenSelectedBackGround))
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                    .padding(.vertical, 3)
            }
            
            
            Spacer()
            
            Text("x 1".getTruncateStr(with: 15))
                .foregroundStyle(Color.getColor(color: .dark48))
                .lineLimit(1)
                .padding(.horizontal, 10)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .frame(width: qtyFrameWidth)
            
            Text("$10.00".getTruncateStr(with: 15))
                .foregroundStyle(Color.getColor(color: .dark48))
                .lineLimit(1)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .frame(width: priceFrameWidth)
                .clipShape(Rectangle())
        }
    }
    
    @ViewBuilder
    func getTotalBill() -> some View {
        HStack(alignment: .top, spacing: 0) {
            VStack(alignment: .leading, spacing: 0){
                Text("Total Bill".getTruncateStr(with: 15))
                    .foregroundStyle(Color.getColor(color: .primaryRed))
                    .lineLimit(1)
                
                Text("inclusive of all taxes & charges")
                    .foregroundStyle(Color.getColor(color: .dark144))
                    .lineLimit(1)
            }
            
            Spacer()
                        
            Text("$30.00".getTruncateStr(with: 15))
                .foregroundStyle(Color.getColor(color: .dark48))
                .lineLimit(1)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .frame(width: priceFrameWidth * 2)
                .clipShape(Rectangle())
        }
    }
}

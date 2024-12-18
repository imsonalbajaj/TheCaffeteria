//
//  MoreView.swift
//  TheCaffeteria
//
//  Created by Sonal on 28/11/24.
//

import SwiftUI

struct MoreView: View {
    @State var dropdownTapped: Bool = false
    @Binding var moreTapped: Bool
    let widthForDetails: CGFloat = 70
    
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            Color.black.opacity(0.3)
                .onTapGesture {
                    moreTapped = false
                }
            
            userIcon()
                .background(
                    VStack{
                        Color(color_primary_red)
                            .frame(height: 52)
                            .clipShape(RoundedCornerShape(corners: [.topLeft, .topRight], radius: 26))
                            .offset(y: -26)
                        
                        Spacer()
                    }
                )
            
            HLine()
                .frame(height: 0.25)
            
            toolsMenu
            
            BottomSafeSection()
        }
        .background(Color.clear)
        .navigationBarHidden(true)
        .ignoresSafeArea(.all)
        .gesture(
            DragGesture()
                .onEnded { value in
                    if value.translation.height > 80 {
                        withAnimation {
                            moreTapped = false
                        }
                    }
                }
        )
    }
    
    @ViewBuilder
    func userIcon() -> some View {
        HStack(alignment: .top, spacing: 0) {
            Image(systemName: "person.fill")
                .scaledToFill()
                .frame(width: 50, height: 50)
                .background(Color.black)
                .foregroundStyle(Color.white)
                .clipShape(Circle())
                .padding(1)
                .background(Color.white)
                .clipShape(Circle())
                .padding(.top, 16)
            
            VStack(alignment: .leading, spacing: 4) {
                HStack(alignment: .lastTextBaseline,spacing: 6){
                    Text("Hey,")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.white)
                    
                    Text("Sonal")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.white)
                    
                }
                
                Button {
                    dropdownTapped.toggle()
                } label: {
                    HStack(spacing: 5) {
                        Image(systemName: dropdownTapped ? "arrow.up" : "arrow.down")
                            .foregroundStyle(Color.white)
                        
                        Text( dropdownTapped ? "    " : "view your account details")
                            .foregroundStyle(Color.white)
                    }
                }
                
                if dropdownTapped {
                    userInfoView()
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 16)
            
            Spacer()
        }
        .padding(.horizontal, 32)
        .padding(.bottom, 32)
        .background(Color(color_primary_red))
    }
    
    @ViewBuilder
    func userInfoView() -> some View {
        VStack(alignment: .leading, spacing: 4) {
            detailsView(txt1: "name", txt2: "sonal")
            detailsView(txt1: "email", txt2: "sonal@mail.com")
            detailsView(txt1: "number", txt2: "9899789899")
        }
        .padding(.top, 8)
    }
    
    var toolsMenu: some View {
        VStack {
            HStack(spacing: 16) {
                Image(systemName: "heart.fill")
                Text("Favourite")
                Spacer()
            }
            .padding(.horizontal, 32)
            .padding(.top, 24)
            
            HStack(spacing: 16) {
                Image(systemName: "questionmark.circle")
                Text("Favourite")
                Spacer()
            }
            .padding(.horizontal, 32)
            .padding(.top, 16)
            
            HStack(spacing: 16) {
                Image(systemName: "arrow.uturn.backward.square")
                Text("Log out")
                Spacer()
            }
            .padding(.horizontal, 32)
            .padding(.top, 16)
        }
        .foregroundStyle(Color.white)
        .background(Color(color_primary_red))
    }
    
    @ViewBuilder
    func detailsView(txt1: String, txt2: String) -> some View {
        HStack(spacing: 0) {
            Text(txt1.getTruncateStr(with: 15))
                .foregroundStyle(Color.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(width: widthForDetails)
            
            Text(":")
                .foregroundStyle(Color.white)
                .lineLimit(1)
                .padding(.horizontal, 4)
            
            Spacer()
            
            Text(txt2.getTruncateStr(with: 15))
                .foregroundStyle(Color.white)
                .frame(maxWidth: .infinity, alignment: .leading)
            
        }
    }
}

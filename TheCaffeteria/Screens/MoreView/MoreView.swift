//
//  MoreView.swift
//  TheCaffeteria
//
//  Created by Sonal on 28/11/24.
//

import SwiftUI

struct MoreView: View {
    @State var dropdownTapped: Bool = false
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            userIcon
            toolsMenu
            Spacer()
        }
        .background(Color.white)
    }
    
    var userIcon: some View {
        HStack(alignment: .top, spacing: 0) {
            Image(systemName: "person.fill")
                .scaledToFill()
                .frame(width: 50, height: 50)
                .background(Color.black)
                .foregroundStyle(Color.white)
                .clipShape(Circle())
                .padding(.top, 16)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Sonal")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.white)
                
                Button {
                    dropdownTapped.toggle()
                } label: {
                    HStack(spacing: 5) {
                        Image(systemName: dropdownTapped ? "arrow.up" : "arrow.down")
                            .foregroundStyle(Color.white)

                        Text( dropdownTapped ? "account details" : "view account details")
                            .foregroundStyle(Color.white)
                    }
                }
                
                if dropdownTapped {
                    userInfoView
                }
            }
            .padding(16)
            
            Spacer()
        }
        .padding(.horizontal, 32)
        .padding(.bottom, 32)
        .background(Color.getColor(color: .primaryRed))
    }
    
    var userInfoView: some View {
        HStack(spacing: 4) {
            VStack(alignment: .leading, spacing: 0) {
                Text("name")
                    .foregroundStyle(Color.white)
                
                Text("email")
                    .foregroundStyle(Color.white)

                Text("phone-no")
                    .foregroundStyle(Color.white)
            }
            
            VStack(spacing: 0) {
                Text(" : ")
                    .foregroundStyle(Color.white)

                Text(" : ")
                    .foregroundStyle(Color.white)

                Text(" : ")
                    .foregroundStyle(Color.white)

            }
            
            VStack(alignment: .leading, spacing: 0) {
                Text("sonal")
                    .foregroundStyle(Color.white)
                
                Text("mail@mail.com")
                    .foregroundStyle(Color.white)
                    .lineLimit(1)
                
                Text("9990001234")
                    .foregroundStyle(Color.white)

            }
        }
        .padding(.top, 8)
    }
    
    var toolsMenu: some View {
        VStack {
            HStack(spacing: 16) {
                Image(systemName: "heart.fill")
                    .foregroundStyle(Color.red)

                Text("Favourite")
                    .foregroundStyle(Color.getColor(color: .dark48))

                Spacer()
            }
            .padding(.horizontal, 32)
            .padding(.top, 24)
            
            HStack(spacing: 16) {
                Image(systemName: "questionmark.circle")
                    .foregroundStyle(Color.black)
                Text("Favourite")
                    .foregroundStyle(Color.getColor(color: .dark48))
                Spacer()
            }
            .padding(.horizontal, 32)
            .padding(.top, 16)
            
            HStack(spacing: 16) {
                Image(systemName: "arrow.uturn.backward.square")
                    .foregroundStyle(Color.blue)
                
                Text("Log out")
                    .foregroundStyle(Color.getColor(color: .dark48))
                Spacer()
            }
            .padding(.horizontal, 32)
            .padding(.top, 16)
        }
    }
}

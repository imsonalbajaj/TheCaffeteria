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
                .foregroundColor(Color.white)
                .clipShape(Circle())
                .padding(.top, 16)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Sonal")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.getColor(color: .dark48))
                Button {
                    dropdownTapped.toggle()
                } label: {
                    HStack(spacing: 5) {
                        Image(systemName: dropdownTapped ? "arrow.up" : "arrow.down")
                            .foregroundColor(Color.getColor(color: .secondaryRed).opacity(0.8))

                        Text( dropdownTapped ? "account details" : "view account details")
                            .foregroundColor(Color.getColor(color: .secondaryRed).opacity(0.8))
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
        .background(Color.getColor(color: .secondaryRed).opacity(0.3))
    }
    
    var userInfoView: some View {
        HStack(spacing: 4) {
            VStack(alignment: .leading, spacing: 0) {
                Text("name")
                    .foregroundColor(Color.getColor(color: .dark96))
                
                Text("email")
                    .foregroundColor(Color.getColor(color: .dark96))

                Text("phone-no")
                    .foregroundColor(Color.getColor(color: .dark96))
            }
            
            VStack(spacing: 0) {
                Text(" : ")
                    .foregroundColor(Color.getColor(color: .dark96))

                Text(" : ")
                    .foregroundColor(Color.getColor(color: .dark96))

                Text(" : ")
                    .foregroundColor(Color.getColor(color: .dark96))

            }
            
            VStack(alignment: .leading, spacing: 0) {
                Text("sonal")
                    .foregroundColor(Color.getColor(color: .dark48))
                
                Text("mail@mail.com")
                    .foregroundColor(Color.getColor(color: .dark48))
                
                Text("9990001234")
                    .foregroundColor(Color.getColor(color: .dark48))

            }
        }
        .padding(.top, 8)
    }
    
    var toolsMenu: some View {
        VStack {
            HStack(spacing: 16) {
                Image(systemName: "heart.fill")
                    .foregroundColor(Color.red)

                Text("Favourite")
                    .foregroundColor(Color.getColor(color: .dark48))

                Spacer()
            }
            .padding(.horizontal, 32)
            .padding(.top, 24)
            
            HStack(spacing: 16) {
                Image(systemName: "questionmark.circle")
                    .foregroundColor(Color.black)
                Text("Favourite")
                    .foregroundColor(Color.getColor(color: .dark48))
                Spacer()
            }
            .padding(.horizontal, 32)
            .padding(.top, 16)
            
            HStack(spacing: 16) {
                Image(systemName: "arrow.uturn.backward.square")
                    .foregroundColor(Color.blue)
                
                Text("Log out")
                    .foregroundColor(Color.getColor(color: .dark48))
                Spacer()
            }
            .padding(.horizontal, 32)
            .padding(.top, 16)
        }
    }
}

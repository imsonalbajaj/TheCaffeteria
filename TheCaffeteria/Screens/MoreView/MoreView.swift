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
                .padding(.horizontal, 32)
            
            Color.gray
                .frame(height: 1)
                .padding(.horizontal, 32)
            
            HStack(spacing: 4) {
                Image(systemName: "heart.fill")
                Text("Favourite")
                Spacer()
            }
            .padding(.horizontal, 32)
            .padding(.top, 16)
            
            HStack(spacing: 4) {
                Image(systemName: "questionmark.circle")
                Text("Favourite")
                Spacer()
            }
            .padding(.horizontal, 32)
            .padding(.top, 16)
            
            HStack(spacing: 4) {
                Image(systemName: "arrow.uturn.backward.square")
                
                Text("Log out")
                Spacer()
            }
            .padding(.horizontal, 32)
            .padding(.top, 16)
            
            Spacer()
        }
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
                Button {
                    dropdownTapped.toggle()
                } label: {
                    HStack(spacing: 5) {
                        Image(systemName: dropdownTapped ? "arrow.up" : "arrow.down")
                        Text( dropdownTapped ? "account details" : "view account details")
                    }
                }
                
                if dropdownTapped {
                    userInfoView
                }
            }
            .padding(16)
            
            Spacer()
        }
    }
    
    var userInfoView: some View {
        HStack(spacing: 2) {
            VStack(alignment: .leading, spacing: 0) {
                Text("name")
                Text("mail")
            }
            
            VStack(spacing: 0) {
                Text(" : ")
                Text(" : ")
            }
            
            VStack(alignment: .leading, spacing: 0) {
                Text("sonal")
                Text("mail@mail.com")
            }
        }
    }
}

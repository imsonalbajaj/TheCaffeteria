//
//  LoginView.swift
//  TheCaffeteria
//
//  Created by Sonal on 18/12/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isLoading: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            TopSafeSection()
            
            Spacer()
            
            VStack(spacing: 0) {
                Text("Login").foregroundStyle(Color(color_dark48)).font(.largeTitle).padding(.horizontal, 48).padding(.vertical, 16).background(Color.white).clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding(16)
                    .frame(maxWidth: .infinity)
                
                TextField("Email or Phone-number", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                
                Color.clear.frame(height: 8)
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    login()
                }) {
                    Text("Login")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical)
                        .background(Color(color_primary_red))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .disabled(isLoading)
                .padding(.vertical)
            }
            .padding()
            .background(Color(color_primary_red).opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .padding()
            
            Spacer()
            BottomSafeSection()
        }
        .background(Color.white)
        .ignoresSafeArea()
        .overlay {
            if isLoading {
                CustomLoaderView()
            }
        }
    }
    
    func login() {
        isLoading = true
    }
}

//
//  UserProfile.swift
//  Little Lemon App
//
//  Created by Guy Chenevert on 2023-12-08.
//

import SwiftUI

struct UserProfile: View {
    @Environment(\.presentationMode) var presentation
    var body: some View {
        VStack {
            Image("Logo")
                .padding(.bottom)
                .padding(.top, 4)
            Text("Personal Information")
                .font(Font.custom("MarkaziText-Medium", size: 35))
                .foregroundColor(Color(hex: "#333333"))
                .padding()
            ZStack {
                Color(hex: "#495E57")
                    .frame(height: 225)
                VStack {
                    Image("Profile")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .cornerRadius(50)
                }
            }
            Spacer()
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text("First Name")
                        .font(Font.custom("Karla-Medium", size: 14))
                        .foregroundColor(Color(hex: "#495E57"))
                    Text(UserDefaults.standard.string(forKey: "f name") ?? "")
                    Color(hex: "#EDEFEE")
                        .frame(height: 1)
                    Text("Last Name")
                        .font(Font.custom("Karla-Medium", size: 14))
                        .foregroundColor(Color(hex: "#495E57"))
                    Text(UserDefaults.standard.string(forKey: "l name") ?? "")
                    Color(hex: "#EDEFEE")
                        .frame(height: 1)
                    Text("Email")
                        .font(Font.custom("Karla-Medium", size: 14))
                        .foregroundColor(Color(hex: "#495E57"))
                    Text(UserDefaults.standard.string(forKey: "e mail") ?? "")
                    Color(hex: "#EDEFEE")
                        .frame(height: 1)
                }
                .padding()
            }
            Spacer()
            Button(action: {
                UserDefaults.standard.setValue(false, forKey: kIsLoggedIn)
                self.presentation.wrappedValue.dismiss()
            }) {
                Text("Sign Out")
                    .font(Font.custom("Karla-bold", size: 16))
            }
            .padding(EdgeInsets(top: 8, leading: 40, bottom: 8, trailing: 40))
            .background(Color(hex: "#F4CE14"))
            .foregroundColor(Color(hex: "#333333"))
            .cornerRadius(8)
            .padding()
            
        }
    }
}

#Preview {
    UserProfile()
}

//
//  Onboarding.swift
//  Little Lemon App
//
//  Created by Guy Chenevert on 2023-12-08.
//

import SwiftUI

let kFirstName = "f name"
let kLastName = "l name"
let kEmail = "e mail"
let kPassword = "pass word"
let kIsLoggedIn = "kIsLoggedIn"

struct Onboarding: View {
    @State var isLoggedIn = false
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Spacer()
                Image("little-lemon-logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit
                    )
                    .frame(width: 150, height: 150)
                    .padding()
                Spacer()
                TextField("First Name", text: $firstName)
                    .padding()
                    .frame(width: 300, height: 35)
                    .border(Color(hex: "#EDEFEE"))
                
                TextField("Last Name", text: $lastName)
                    .padding()
                    .frame(width: 300, height: 35)
                    .border(Color(hex: "#EDEFEE"))
                TextField("Email", text: $email)
                    .padding()
                    .frame(width: 300, height: 35)
                    .border(Color(hex: "#EDEFEE"))
                TextField("Password", text: $password)
                    .padding()
                    .frame(width: 300, height: 35)
                    .border(Color(hex: "#EDEFEE"))
                Button(action: {
                    if !firstName.isEmpty && !lastName.isEmpty &&
                        !email.isEmpty && !password.isEmpty {
                        UserDefaults.standard.set(firstName, forKey: kFirstName)
                        UserDefaults.standard.set(lastName, forKey: kLastName)
                        UserDefaults.standard.set(email, forKey: kEmail)
                        UserDefaults.standard.set(password, forKey: kPassword)
                        UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                        isLoggedIn = true
                    } else {
                        isLoggedIn = false
                    }
                    
                    
                }) {
                    Text("Sign Up")
                        .font(Font.custom("Karla-Bold", size: 16))
                }.navigationDestination(isPresented: $isLoggedIn, destination: {Home()})
                .padding(EdgeInsets(top: 8, leading: 40, bottom: 8, trailing: 40))
                .background(Color(hex: "#F4CE14"))
                .foregroundColor(Color(hex: "#333333"))
                .cornerRadius(8)
                .padding()
            Spacer()
            Spacer()
            }
            .onAppear() {
                if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
                    isLoggedIn = true
                }
            }
        }
    }
}

#Preview {
    Onboarding()
}

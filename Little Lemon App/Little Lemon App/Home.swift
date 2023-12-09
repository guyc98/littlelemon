//
//  Home.swift
//  Little Lemon App
//
//  Created by Guy Chenevert on 2023-12-08.
//

import SwiftUI

struct Home: View {
    var body: some View {
        TabView {
            Menu()
                .tabItem({
                    Label("Menu", systemImage: "menucard")
                })
            UserProfile()
                .tabItem({
                    Label("Profile", systemImage: "person")
                })
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Home()
}

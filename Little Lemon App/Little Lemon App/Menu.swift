//
//  Menu.swift
//  Little Lemon App
//
//  Created by Guy Chenevert on 2023-12-08.
//

import SwiftUI

struct Menu: View {
    @State var showSearch = false
    @State var searchText = ""
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color(hex: "#333333"))
                    .font(.title2)
                    .onTapGesture {
                        showSearch.toggle()
                    }
                Spacer()
                Image("Logo")
                Spacer()
                Image(systemName: "person.fill")
                    .font(.title2)
                    .padding(.trailing)
                    .foregroundColor(Color(hex: "#333333"))
            }.padding(.bottom)
                .padding(.top, 4)
                .padding(.leading)
                .padding(.trailing)
            if showSearch {
                TextField("Search", text: $searchText)
                    .padding()
                    .background(Color(hex: "#EDEFEE"))
                    .frame(width: 340, height: 30)
                    .cornerRadius(15)
                    .padding(.init(top: 1, leading: 0, bottom: 10, trailing: 0))
            }
            ZStack {
                Color(hex: "#495E57")
                HStack {
                    VStack(alignment: .leading) {
                        Spacer()
                        Text("Little Lemon")
                            .font(Font.custom("MarkaziText-Medium", size: 35))
                            .foregroundColor(Color(hex: "#F4CE14"))
                        Text("Chicago")
                            .font(Font.custom("MarkaziText-Regular", size: 25))
                            .foregroundColor(Color(hex: "#EDEFEE"))
                        Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                            .font(Font.custom("Karla-Medium", size: 16))
                            .foregroundColor(Color(hex: "#EDEFEE"))
                        Spacer()
                    }
                    Image("Hero image")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 128, height: 170)
                        .cornerRadius(10)
                        .padding(.leading)

                }.padding()
            }
            VStack {
                HStack() {
                    Text("Order for Delivery")
                        .font(Font.custom("Karla-Bold", size: 22))
                        .padding()
                    Spacer()
                }
                HStack {
                    Button(action: {
                        print("hello")
                    }) {
                        Text("Starters")
                            .font(Font.custom("Karla-Bold", size: 16))
                            .foregroundColor(Color(hex: "#495E57"))
                            .padding(.init(top: 5, leading: 16.25, bottom: 5, trailing: 16.25))
                            .background(Color(hex: "#EDEFEE"))
                            .cornerRadius(50)
                    }
                    Button(action: {
                        print("hello")
                    }) {
                        Text("Mains")
                            .font(Font.custom("Karla-Bold", size: 16))
                            .foregroundColor(Color(hex: "#495E57"))
                            .padding(.init(top: 5, leading: 16.25, bottom: 5, trailing: 16.25))
                            .background(Color(hex: "#EDEFEE"))
                            .cornerRadius(50)
                    }
                    Button(action: {
                        print("hello")
                    }) {
                        Text("Desserts")
                            .font(Font.custom("Karla-Bold", size: 16))
                            .foregroundColor(Color(hex: "#495E57"))
                            .padding(.init(top: 5, leading: 16.25, bottom: 5, trailing: 16.25))
                            .background(Color(hex: "#EDEFEE"))
                            .cornerRadius(50)
                    }
                    Button(action: {
                        print("hello")
                    }) {
                        Text("Sides")
                            .font(Font.custom("Karla-Bold", size: 16))
                            .foregroundColor(Color(hex: "#495E57"))
                            .padding(.init(top: 5, leading: 16.25, bottom: 5, trailing: 16.25))
                            .background(Color(hex: "#EDEFEE"))
                            .cornerRadius(50)
                    }
                }
                Color(hex: "#EDEFEE")
                    .frame(height: 1.5)
                    .padding(.top)
            }
            List {
                
            }
        }
    }
}

#Preview {
    Menu()
}

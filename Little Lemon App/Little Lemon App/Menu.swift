//
//  Menu.swift
//  Little Lemon App
//
//  Created by Guy Chenevert on 2023-12-08.
//

import SwiftUI

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State var showSearch = false
    @State var searchText = ""
    
    @State var showStarters = false
    @State var showMains = false
    @State var showDesserts = false
    @State var showSides = false
    
    func buildSortDescriptors () -> [NSSortDescriptor] {
        return [NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedStandardCompare))]
    }
    
    func buildPredicate () -> NSPredicate {
        if !searchText.isEmpty {
            return NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        }
        
        if showStarters {
            return NSPredicate(format: "category == %@", "starters")
        }
        if showMains {
            return NSPredicate(format: "category == %@", "mains")
        }
        if showDesserts {
            return NSPredicate(format: "category == %@", "desserts")
        }
        if showSides {
            return NSPredicate(format: "category == %@", "sides")
        }
        return NSPredicate(value: true)
    }
    
    func getMenuData() throws {
        
        let jsonAddress = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
        
        let url = URL(string: jsonAddress)
        
        guard let url = url else {
            throw NSError()
        }
        
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                print(String(data: data, encoding: .utf8) ?? "Empty")
                
                let decoder = JSONDecoder()
                let menuList = try? decoder.decode(MenuList.self, from: data)
                
                print(menuList?.menu ?? "Empty")
                
                if let menuList = menuList {
                    for item in menuList.menu {
                        let dish = Dish(context: viewContext)
                        dish.title = item.title
                        dish.price = item.price
                        dish.image = item.image
                        dish.category = item.category
                        
                        try? viewContext.save()
                    }
                }
            }
        }
        
        task.resume()
    }
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
                        showStarters.toggle()
                        showMains = false
                        showDesserts = false
                        showSides = false
                    }) {
                        Text("Starters")
                            .font(Font.custom("Karla-Bold", size: 16))
                            .foregroundColor(Color(hex: showStarters ? "#EDEFEE" : "#495E57"))
                            .padding(.init(top: 5, leading: 16.25, bottom: 5, trailing: 16.25))
                            .background(Color(hex: showStarters ? "#495E57" : "#EDEFEE"))
                            .cornerRadius(50)
                    }
                    Button(action: {
                        showMains.toggle()
                        showStarters = false
                        showDesserts = false
                        showSides = false
                    }) {
                        Text("Mains")
                            .font(Font.custom("Karla-Bold", size: 16))
                            .foregroundColor(Color(hex: showMains ? "#EDEFEE" : "#495E57"))
                            .padding(.init(top: 5, leading: 16.25, bottom: 5, trailing: 16.25))
                            .background(Color(hex: showMains ? "#495E57" : "#EDEFEE"))
                            .cornerRadius(50)
                    }
                    Button(action: {
                        showDesserts.toggle()
                        showMains = false
                        showStarters = false
                        showSides = false
                    }) {
                        Text("Desserts")
                            .font(Font.custom("Karla-Bold", size: 16))
                            .foregroundColor(Color(hex: showDesserts ? "#EDEFEE" : "#495E57"))
                            .padding(.init(top: 5, leading: 16.25, bottom: 5, trailing: 16.25))
                            .background(Color(hex: showDesserts ? "#495E57" : "#EDEFEE"))
                            .cornerRadius(50)
                    }
                    Button(action: {
                        showSides.toggle()
                        showMains = false
                        showStarters = false
                        showDesserts = false
                    }) {
                        Text("Sides")
                            .font(Font.custom("Karla-Bold", size: 16))
                            .foregroundColor(Color(hex: showSides ? "#EDEFEE" : "#495E57"))
                            .padding(.init(top: 5, leading: 16.25, bottom: 5, trailing: 16.25))
                            .background(Color(hex: showSides ? "#495E57" : "#EDEFEE"))
                            .cornerRadius(50)
                    }
                }
                Color(hex: "#EDEFEE")
                    .frame(height: 1.5)
                    .padding(.top)
            }
            FetchedObjects(
                predicate: buildPredicate(),
                sortDescriptors: buildSortDescriptors())
            { (dishes: [Dish]) in
                
                List {
                    ForEach(dishes) { dish in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(dish.title ?? "Unknown")
                                    .padding(.bottom)
                                Text("$\(dish.price ?? "Unknown").00")
                            }
                            Spacer()
                            AsyncImage(url: URL(string: dish.image!)) { image in
                                image
                                    .image?.resizable()
                                    .aspectRatio(contentMode: .fit)
                            }
                            .frame(width: 150, height: 150)
                        }
                    }
                }
                .searchable(text: $searchText)
                .listStyle(.plain)
            }
        }.onAppear() {
            do {
                try getMenuData()
            }
            catch {
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    Menu()
}

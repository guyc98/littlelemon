//
//  Models.swift
//  Little Lemon App
//
//  Created by Guy Chenevert on 2023-12-09.
//

import Foundation

struct MenuList: Decodable {
    enum CodeKeys: String, CodingKey {
        case menu
    }
    
    let menu: [MenuItem]
}

struct MenuItem: Decodable {
    enum CodeKeys: String, CodingKey {
        case title
        case price
        case image
        case category
    }
    let title: String
    let price: String
    let image: String
    let category: String
}

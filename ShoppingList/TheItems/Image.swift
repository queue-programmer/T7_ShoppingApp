//
//  ImageView.swift
//  ShoppingList
//
//  Created by Yme Knudsen Bogfjelldal on 16/10/2021.
//

import Foundation

struct Picture: Codable {
    let thumbnail, large: Large
}

struct Large: Codable {
    let url: String
}

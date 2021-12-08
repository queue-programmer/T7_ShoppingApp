//
//  ImageView.swift
//  ShoppingList
//
//  Created by Yme Knudsen Bogfjelldal on 16/10/2021.
//

import Foundation

struct Image: Codable {
    let thumbnail, large: Large
}

struct Large: Codable {
    let url: String
}

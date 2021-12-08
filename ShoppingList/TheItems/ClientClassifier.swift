//
//  ClientClassifier.swift
//  ShoppingList
//
//  Created by Yme Knudsen Bogfjelldal on 19/10/2021.
//

import Foundation

struct ClientClassifier: Codable {
    let name: String
    let imageURL: String
    let isImportant: Bool

    enum CodingKeys: String, CodingKey {
        case name
        case imageURL = "image_url"
        case isImportant = "is_important"
    }
}

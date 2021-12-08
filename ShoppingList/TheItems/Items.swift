//
//  ProductInfo.swift
//  ShoppingList
//
//  Created by Yme Knudsen Bogfjelldal on 15/10/2021.
//

import Foundation

struct Items: Codable {
    let items: [Item]

    enum CodingKeys: String, CodingKey {
        case items
    }
}

struct Item: Codable {
    let product: Product
    let quantity: Int
    let displayPriceTotal, discountedDisplayPriceTotal: String
    let availability: Availability

    enum CodingKeys: String, CodingKey {
        case product, quantity
        case displayPriceTotal = "display_price_total"
        case discountedDisplayPriceTotal = "discounted_display_price_total"
        case availability
    }
}

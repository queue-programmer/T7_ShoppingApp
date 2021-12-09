//
//  Product.swift
//  ShoppingList
//
//  Created by Yme Knudsen Bogfjelldal on 19/10/2021.
//

import Foundation

struct Product: Codable {
    let id: Int
    let fullName: String
    let brand: String?
    let brandID: Int?
    let name, nameExtra: String
    let frontURL: String
    let images: [Picture]
    let grossPrice, grossUnitPrice, unitPriceQuantityAbbreviation, unitPriceQuantityName: String
    let discount: Discount?
    let promotion: Promotion?
    let availability: Availability
    let clientClassifiers: [ClientClassifier]

    enum CodingKeys: String, CodingKey {
        case id
        case fullName = "full_name"
        case brand
        case brandID = "brand_id"
        case name
        case nameExtra = "name_extra"
        case frontURL = "front_url"
        case images
        case grossPrice = "gross_price"
        case grossUnitPrice = "gross_unit_price"
        case unitPriceQuantityAbbreviation = "unit_price_quantity_abbreviation"
        case unitPriceQuantityName = "unit_price_quantity_name"
        case discount, promotion, availability
        case clientClassifiers = "client_classifiers"
    }
}

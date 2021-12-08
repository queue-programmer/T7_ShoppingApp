//
//  Availability.swift
//  ShoppingList
//
//  Created by Yme Knudsen Bogfjelldal on 16/10/2021.
//

import Foundation

struct Availability: Codable {
    let isAvailable: Bool
    let code: Code
    let availabilityDescription: Description
    let descriptionShort: DescriptionShort

    enum CodingKeys: String, CodingKey {
        case isAvailable = "is_available"
        case code
        case availabilityDescription = "description"
        case descriptionShort = "description_short"
    }
}
enum Description: String, Codable {
    case empty = ""
    case utsolgtFraLeverandør = "Utsolgt fra leverandør"
}

enum Code: String, Codable {
    case available = "available"
    case soldOutSupplier = "sold_out_supplier"
}

enum DescriptionShort: String, Codable {
    case empty = ""
    case utsolgt = "Utsolgt"
}

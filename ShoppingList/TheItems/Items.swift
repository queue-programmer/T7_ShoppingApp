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
    var quantity: Int = 0
    let displayPriceTotal, discountedDisplayPriceTotal: String
    let availability: Availability
    
    mutating func changeQuantity(amount: Int){
        self.quantity += amount
    }

    enum CodingKeys: String, CodingKey {
        case product
        case displayPriceTotal = "display_price_total"
        case discountedDisplayPriceTotal = "discounted_display_price_total"
        case availability
    }
    #if DEBUG
    static let example = Item(product: ShoppingList.Product(id: 23551, fullName: "Gresskar Butternut Portugal/ Spania, 750 g", brand: nil, brandID: nil, name: "Gresskar Butternut", nameExtra: "Portugal/ Spania, 750 g", frontURL: "https://kolonial.no/produkter/23551-gresskar-butternut-portugal-spania/", images: [ShoppingList.Picture(thumbnail: ShoppingList.Large(url: "https://bilder.kolonial.no/produkter/d0083d5f-1101-4e7c-82e8-9f4210fdbd65.jpg?fit=max&w=500&s=f995d906632c729f4e00906118d5f900"), large: ShoppingList.Large(url: "https://kolonial.no/media/uploads/public/386/259/130259-3a5f7-product_large.jpg"))], grossPrice: "33.00", grossUnitPrice: "44.00", unitPriceQuantityAbbreviation: "kg", unitPriceQuantityName: "Kilogram", discount: nil, promotion: nil, availability: ShoppingList.Availability(isAvailable: true, code: ShoppingList.Code.available, availabilityDescription: ShoppingList.Description.empty, descriptionShort: ShoppingList.DescriptionShort.empty), clientClassifiers: []), quantity: 1, displayPriceTotal: "33.00", discountedDisplayPriceTotal: "33.00", availability: ShoppingList.Availability(isAvailable: true, code: ShoppingList.Code.available, availabilityDescription: ShoppingList.Description.empty, descriptionShort: ShoppingList.DescriptionShort.empty))
    #endif
}

struct ExtendedItem: Codable{
    let item: Item
    let quantity: Int
}

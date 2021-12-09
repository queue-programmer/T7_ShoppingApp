//
//  ChangeQuantity.swift
//  ShoppingList
//
//  Created by Yme Bogfjelldal on 09/12/2021.
//

import Foundation

protocol ChangeQuantity{
    
    func AddRemove(item: Item, amount: Int)
}

//  ViewModel.swift
//  ShoppingList
//
//  Created by Yme Knudsen Bogfjelldal on 19/10/2021.

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    
    @Published var shoppingCart: [Item]?
    
    @Published var stuffCart: Int = 0
    @Published var totalPrice: Double = 0.00
    
//    @Published var shoppingCartContents: [Item]
    
    let jsonLogic: JsonLogic = JsonLogic()
    
    //let url: String = "https://api.jsonbin.io/b/60832bec4465377a6bc6b6e6"
    
    init(){
        loadShoppingCart()
    }
    
    func ChangeItemQuantity(item: Item, amount: Int){
        
        let index = self.shoppingCart?.firstIndex{$0.product.id == item.product.id}  
        self.shoppingCart?[index!].changeQuantity(amount: amount)
        
        stuffCart += amount
        totalPrice += Double(item.product.grossPrice)! * Double(amount)
    }
    
    func updateShoppingCart(){
        if shoppingCart != nil{
            for item in shoppingCart!{
                ChangeItemQuantity(item: item, amount: item.quantity)
            }
        }
    }
    
    func loadShoppingCart() {
        if let url = URL(string: "https://api.jsonbin.io/b/60832bec4465377a6bc6b6e6"){
            jsonLogic.performRequest(url){
                [weak self] result in
                self?.recieveData(result: result)
            }
        }
    }
    
    func saveTheShoppingCart(){
        guard let data = try? JSONEncoder().encode(shoppingCart) else {
            return
        }
        UserDefaults.standard.set(data, forKey: "SaveShoppingCart")
    }
    
    func loadTheShoppingCart(){
        var itemCache: [Item]?
        if let data = UserDefaults.standard.data(forKey: "SaveShoppingCart"){
            itemCache = try? JSONDecoder().decode([Item].self, from: data)
        }
        if itemCache != nil && itemCache?.count != 0 {
            shoppingCart = itemCache
            updateShoppingCart()
        }
    }
    
    private func recieveData(result: Result<Items?, Error>) {
        switch result{
        case .success(let items):
            DispatchQueue.main.async { [weak self] in
                self?.shoppingCart = items?.items
                self?.loadTheShoppingCart()
            }
        case .failure(let error):
            DispatchQueue.main.async { [weak self] in
                print(error)
            }
        }
    }
}

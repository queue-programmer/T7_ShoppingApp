//  ViewModel.swift
//  ShoppingList
//
//  Created by Yme Knudsen Bogfjelldal on 19/10/2021.

import Foundation
import SwiftUI

enum Appstate{
    case succsess
    case loading
    case error
}

class ViewModel: ObservableObject {
    
    @Published var shoppingCart: [Item]?
    
    @Published var stuffCart: Int = 0
    @Published var totalPrice: Double = 0.00
    
    @Published var state = Appstate.loading
    
//    @Published var shoppingCartContents: [Item]
    
    let jsonLogic: JsonLogic = JsonLogic()
    
    //let url: String = "https://api.jsonbin.io/b/608071a7a2213a0c1428343f/1"
    
    init(){
        loadShoppingCart()
    }
    
    func ChangeItemQuantity(item: Item, amount: Int){
        
        let index = self.shoppingCart?.firstIndex{$0.product.id == item.product.id}
        self.shoppingCart?[index!].changeQuantity(amount: amount)
        
        stuffCart += amount
        totalPrice += Double(item.product.grossPrice)! * Double(amount)
    }
    
    func updateShoppingCart(items: [ExtendedItem]?){
        if shoppingCart != nil{
            for item in shoppingCart!{
                if items != nil{
                    let current = items!.first(where:{$0.item.product.id == item.product.id})
                    ChangeItemQuantity(item: item, amount: current!.quantity)
                }
            }
        }
    }
    
    func loadShoppingCart() {
        if let url = URL(string: "https://api.jsonbin.io/b/608071a7a2213a0c1428343f/1"){
            jsonLogic.performRequest(url){
                [weak self] result in
                self?.recieveData(result: result)
            }
        } else {
            state = Appstate.error
        }
    }
    
    func getExtendednItemList() -> [ExtendedItem]{
        var listToReturn: [ExtendedItem] = []
        guard let items = shoppingCart else{
            return listToReturn
        }
        for item in items{
            listToReturn.append(ExtendedItem(item: item, quantity: item.quantity))
        }
        return listToReturn
    }
    
    func saveTheShoppingCart(){
        guard let data = try? JSONEncoder().encode(getExtendednItemList()) else {
            return
        }
        UserDefaults.standard.set(data, forKey: "SaveShoppingCart")
    }
    
    func loadTheShoppingCart(){
        var itemCache: [ExtendedItem]?
        if let data = UserDefaults.standard.data(forKey: "SaveShoppingCart"){
            itemCache = try? JSONDecoder().decode([ExtendedItem].self, from: data)
        }
        if itemCache != nil && itemCache?.count != 0 {
            updateShoppingCart(items: itemCache)
        }
    }
    
    private func recieveData(result: Result<Items?, Error>) {
        switch result{
        case .success(let items):
            DispatchQueue.main.async { [weak self] in
                self?.shoppingCart = items?.items
                self?.loadTheShoppingCart()
                self?.state = Appstate.succsess
            }
        case .failure(let error):
            DispatchQueue.main.async { [weak self] in
                self?.state = Appstate.error
                print(error)
            }
        }
    }
}


//
//  CartView.swift
//  ShoppingList
//
//  Created by Yme Bogfjelldal on 10/12/2021.
//

import Foundation
import SwiftUI

struct shoppingCartView: View{
    
    let itemsInTheCart: Int
    let totalPrice: Double
    
    var body: some View{
        if(itemsInTheCart > 0){
            HStack{
                Image(systemName: "cart")
                    .frame(width: 32.0, height: 32.0)
                    
                Text("\(itemsInTheCart) products")
                    .font(Font.custom("Rubik-Medium", size: 14.0))
                
                Spacer()
                
                Text(String(format:"kr %.2f", totalPrice))
                    .font(Font.custom("Rubik-Medium", size: 14.0))
            }
            .padding()
        }
    }
}

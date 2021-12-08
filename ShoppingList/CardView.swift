//
//  CardView.swift
//  ShoppingList
//
//  Created by Yme Knudsen Bogfjelldal on 15/10/2021.
//

import SwiftUI

struct CardView: View{
    
    let item: Item
    
    var body: some View {
        HStack{
            Text(item.product.name)
                .frame(width: 400, height: 100)
                .padding()
            Spacer() 
        }
    }
}


//
//  ContentView.swift
//  ShoppingList
//
//  Created by Yme Knudsen Bogfjelldal on 15/10/2021.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
    
    var body: some View {
        ScrollView{
            VStack(spacing: 0){
            
                if let shoppingCart = viewModel.shoppingCart{
                    ForEach(0..<shoppingCart.count){ i in
                        CardView(item: shoppingCart[i])
                    }
                }
                
            }//.background(Color.white)
            .navigationTitle("Shopping Cart")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark)
        ContentView().preferredColorScheme(.light)
    }
}

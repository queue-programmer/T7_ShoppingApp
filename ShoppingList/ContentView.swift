//
//  ContentView.swift
//  ShoppingList
//
//  Created by Yme Knudsen Bogfjelldal on 15/10/2021.
//

import SwiftUI

struct ContentView: View, ChangeQuantity {
    func AddRemove(item: Item, amount: Int) {
        viewModel.ChangeItemQuantity(item: item, amount: amount)
    }
    
    @StateObject var viewModel = ViewModel()
//
//    mutable var cartContent: Int = 0
    
//    var priceTotal: Double = 0.00
    
//    func stuffCart(item: Item) -> View{
//        if (item.quantity > 0){
//            cartContent += item.quantity
//            priceTotal += Double(item.product.grossPrice) * Double(item.quantity)
//        }
//        return EmptyView()
//    }
    
    var body: some View{
        ScrollView{
            VStack(spacing: 0){
            
                if let shoppingCart = viewModel.shoppingCart{
                    ForEach(0..<shoppingCart.count){ i in
                        
//                        stuffCart(item: shoppingCart[i])
                        CardView(item: shoppingCart[i], changeQuantity: self)
                    }
                }
            }
            .navigationTitle("Shopping Cart")
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)){ _ in
            viewModel.saveTheShoppingCart()
        }
        shoppingCartView(itemsInTheCart: viewModel.stuffCart, totalPrice: viewModel.totalPrice)
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView().preferredColorScheme(.light)
//    }
//}

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
    
    var body: some View{
        
        if viewModel.state == Appstate.loading{
            ProgressView()
        } else if viewModel.state == Appstate.error{
            Button("Reload"){
                viewModel.loadShoppingCart()
            }
        } else if viewModel.state == Appstate.succsess{
            ScrollView{
                VStack(spacing: 0){
                    
                    Text("Shopping Cart")
                            .font(.title)
                
                    if let shoppingCart = viewModel.shoppingCart{
                        ForEach(0..<shoppingCart.count){ i in
                            CardView(item: shoppingCart[i], changeQuantity: self)
                        }
                    }
                }
//               .navigationTitle("Shopping Cart")
//                .navigationBarTitle(Text("Shopping Cart"))
            }
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)){ _ in
                viewModel.saveTheShoppingCart()
                
            }
        }
        shoppingCartView(itemsInTheCart: viewModel.stuffCart, totalPrice: viewModel.totalPrice)
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView().preferredColorScheme(.light)
//    }
//}

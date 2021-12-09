//
//  CardView.swift
//  ShoppingList
//
//  Created by Yme Knudsen Bogfjelldal on 15/10/2021.
//

import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct CardView: View{
    
    let item: Item
    let changeQuantity: ChangeQuantity
    
    @State private var showFullInamge: Bool = false
    
    var body: some View {
        HStack{
            ZStack{
                WebImage(url: URL(string: item.product.images[0].thumbnail.url))
                    .placeholder(Image(systemName: "photo"))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 56.0, height: 56.0)
                    .onTapGesture{
                        showFullInamge = true
                    }
            }
            .sheet(isPresented: $showFullInamge, content: {
                WebImage(url: URL(string: item.product.images[0].thumbnail.url))
                    .resizable()
                    .scaledToFit()
            })
            
            VStack(alignment: .leading){
                Text(item.product.name)
                    .font(Font.custom("Rubik-Medium", size: 14.0))
    //                .frame(width: 400, height: 100)
                if item.product.availability.isAvailable{
                    Text(item.product.nameExtra)
                        .font(Font.custom("Rubik-Regular", size: 14.0))
                } else {
                    Text("OUT OF STOCK")
                        .font(Font.custom("Rubik-Medium", size: 14.0))
                        .foregroundColor(Color("OutOfStockText"))
                }
            }
            
            Spacer()
            
            VStack(alignment: .trailing){
                if item.quantity <= 1{
                    if item.product.discount != nil {
                        Text("kr \(item.discountedDisplayPriceTotal)" )
                            .font(Font.custom("Rubik-Regular", size: 14.0))
                            .foregroundColor(Color("AccentAction"))
                        Text("kr \(item.displayPriceTotal)")
                            .font(Font.custom("Rubik-Regular", size: 14.0))
                            .foregroundColor(Color("SecondaryText"))
                            .strikethrough()
                    } else {
                        Text("kr \(item.discountedDisplayPriceTotal)" )
                            .font(Font.custom("Rubik-Regular", size: 14.0))
                        Text("kr \(item.product.grossUnitPrice)/\(item.product.unitPriceQuantityAbbreviation)")
                            .font(Font.custom("Rubik-Regular", size: 14.0))
                            .foregroundColor(Color("SecondaryText"))
                    }
                }
            }
            
            if(item.quantity > 1){
                Button(action:{
                    changeQuantity.AddRemove(item: item, amount: -1)
                }){
                    Image(systemName: "minus.circle")
                }
                .frame(width: 32.0, height: 32.0)
                
                Text("\(item.quantity - 1)")
                
                Button(action:{
                    changeQuantity.AddRemove(item: item, amount: 1)
                }){
                    Image(systemName: "plus.circle")
                }
                .frame(width: 32.0, height: 32.0)
                
            } else {
                if(item.availability.isAvailable){
                    Button(action:{
                        changeQuantity.AddRemove(item: item, amount: 1)
                    }){
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(Color("AccentAction"))
                    }
                    .frame(width: 32.0, height: 32.0)
                    
                }else{
                    Button(action:{
                        
                    }){
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(Color("AccentAction"))
                            .opacity(0.5)
                    }
                    .frame(width: 32.0, height: 32.0)
                }
            }
        }
    }
}

//struct CardViewProvider: PreviewProvider {
//    static var previews: some View {
//        CardView(item: Item.example).preferredColorScheme(.light)
//        }
//    }

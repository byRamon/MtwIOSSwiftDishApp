//
//  ItemDetailView.swift
//  SwiftDishApp
//
//  Created by ByRamon on 29/02/20.
//  Copyright © 2020 ByRamon. All rights reserved.
//

import SwiftUI

struct ItemDetailView: View {
    var item: MenuItem
    @EnvironmentObject var order : Order
    @EnvironmentObject var favoritos : Favoritos
    var itemInd: Int {
        favoritos.items.firstIndex(where: { $0.id == item.id }) ?? -1
    }
    var body: some View {
        VStack{
            ZStack(alignment: .bottomTrailing){
                Image(item.mainImage)
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(Color.white)
                    .offset(x:-5, y:-5)
            }
            Text(item.description)
                .padding()
            Button("Order This"){
                //Agregar elemento a la orden
                self.order.add(item: self.item)
            }.font(.headline)
            Spacer()
        }.navigationBarItems(trailing: Button(action: {
            if(self.itemInd < 0){
                self.favoritos.add(item: self.item)
            }
            else{
                self.favoritos.remove(item: self.item)
            }
        }) {
            if(self.itemInd < 0){
                Image(systemName: "heart").foregroundColor(.gray)
            }
            else {
                Image(systemName: "heart.fill").foregroundColor(.yellow)
            }
        })
        .navigationBarTitle(Text(item.name), displayMode: .inline)
    }
}

struct ItemDetailView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        ItemDetailView(item: MenuItem.example).environmentObject(order)
    }
}

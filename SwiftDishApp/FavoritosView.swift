//
//  FavoritosView.swift
//  SwiftDishApp
//
//  Created by ByRamon on 20/03/20.
//  Copyright © 2020 ByRamon. All rights reserved.
//

import SwiftUI

struct FavoritosView: View {
    @EnvironmentObject var favoritos : Favoritos
    var body: some View {
        NavigationView{
            List{
                Section{
                    ForEach(favoritos.items){ item in
                        HStack{
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }.onDelete(perform: deleteItems)
                }
            }.navigationBarTitle("Favorites")
            .listStyle(GroupedListStyle())
            .navigationBarItems(trailing: EditButton())
        }
    }
    func deleteItems(at offsets: IndexSet){
        favoritos.items.remove(atOffsets: offsets)
    }
}

struct FavoritosView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritosView()
    }
}

//
//  AppView.swift
//  SwiftDishApp
//
//  Created by ByRamon on 07/03/20.
//  Copyright © 2020 ByRamon. All rights reserved.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView{
            //Tab1
            ContentView().tabItem{
                Image(systemName: "list.dash")
            }
            FavoritosView().tabItem{
                Image(systemName: "heart.fill")
            }
            //tab2
            OrderView().tabItem{
                Image(systemName: "square.and.pencil")
                Text("Order")
            }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        AppView().environmentObject(order)
    }
}

//
//  ItemView.swift
//  SwiftDishApp
//
//  Created by ByRamon on 29/02/20.
//  Copyright © 2020 ByRamon. All rights reserved.
//

import SwiftUI

struct ItemView: View {
    var item: MenuItem
    let colors:[String: Color] = [
        "D": .purple,
        "G": .black,
        "N": .red,
        "S": .blue,
        "V": .green
    ]
    var body: some View {
        NavigationLink(destination: ItemDetailView(item: item)){
            HStack{
                Image(item.thumbnailImage)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                VStack(alignment: .leading) {
                    Text(item.name)
                        .font(.headline)
                    Text(String("$\(item.price)"))
                }
                Spacer()
                ForEach(item.restrictions, id:\.self){ restriction in
                    Text(restriction)
                        .font(.caption)
                        .fontWeight(.black)
                        .padding(5)
                        .background(self.colors[restriction, default: .black])
                        .clipShape(Circle())
                        .foregroundColor(.white)
                }
            }
        }
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(item: MenuItem.example)
    }
}

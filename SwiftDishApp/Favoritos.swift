//
//  Favoritos.swift
//  SwiftDishApp
//
//  Created by ByRamon on 20/03/20.
//  Copyright © 2020 ByRamon. All rights reserved.
//

import Foundation

class Favoritos : ObservableObject{
    //var items = [MenuItem]()
    @Published var items = [MenuItem]()
    var total: Int {
        if items.count > 0 {
            return items.reduce(0) { $0 + $1.price }
        } else {
            return 0
        }
    }
    func add(item: MenuItem) {
        items.append(item)
    }

    func remove(item: MenuItem) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
    }
}

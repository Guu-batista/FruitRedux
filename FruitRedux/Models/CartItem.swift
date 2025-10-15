//
//  CartItem.swift
//  FruitRedux
//
//  Created by Gustavo Batista on 14/10/25.
//

import Foundation

struct CartItem: Identifiable, Equatable {
    let id: UUID
    let fruit: Fruit
    var quantity: Int

    init(id: UUID = .init(), fruit: Fruit, quantity: Int = 1) {
        self.id = id
        self.fruit = fruit
        self.quantity = quantity
    }
}

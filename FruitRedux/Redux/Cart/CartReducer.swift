//
//  CartReducer.swift
//  FruitRedux
//
//  Created by Gustavo Batista on 14/10/25.
//

import Foundation

func cartReducer(state: inout CartState, action: CartAction) {
    switch action {
    case .add(let fruit):
        if let idx = state.items.firstIndex(where: { $0.fruit.id == fruit.id }) {
            state.items[idx].quantity += 1
        } else {
            state.items.append(CartItem(fruit: fruit))
        }
    case .remove(let id):
        state.items.removeAll { $0.id == id }
    case .increase(let id):
        if let idx = state.items.firstIndex(where: { $0.id == id }) {
            state.items[idx].quantity += 1
        }
    case .decrease(let id):
        if let idx = state.items.firstIndex(where: { $0.id == id }) {
            state.items[idx].quantity -= 1
            if state.items[idx].quantity <= 0 {
                state.items.remove(at: idx)
            }
        }
    case .clear:
        state.items.removeAll()
    case .confirmPurchase:
        state.lastConfirmedAt = Date()
        state.items.removeAll()
    }
}

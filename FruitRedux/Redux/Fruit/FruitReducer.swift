//
//  FruitReducer.swift
//  FruitRedux
//
//  Created by Gustavo Batista on 14/10/25.
//

import Foundation

func fruitReducer(state: inout FruitState, action: FruitAction) {
    switch action {
    case .setLoading(let v):
        state.isLoading = v
    case .setFruits(let list):
        state.fruits = list
        state.isLoading = false
    case .addFruit(let f):
        state.fruits.append(f)
    case .removeFruit(let id):
        state.fruits.removeAll { $0.id == id }
    }
}
